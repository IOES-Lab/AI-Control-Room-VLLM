// Copyright (C) 2019  Rhys Mainwaring
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

/// \file Physics.hh
/// \brief This file contains definitions for the physics models used
/// to calculate hydrostatic and hydrodynamic forces.
///
/// The hydrostatic and hydrodynamic calculations provided here follow the
///  methods described by Jacques Kerner in his blog series:
///
/// <http://www.gamasutra.com/view/news/237528/Water_interaction_model_for_boats_in_video_games.php>
/// <http://www.gamasutra.com/view/news/263237/Water_interaction_model_for_boats_in_video_games_Part_2.php>
///
/// which in turn drew inspiration from the program SimShip by Edouard Halbert:
///
/// <https://archive.codeplex.com/?p=simship>
/// <https://www.youtube.com/watch?v=6NNfmfSMwKs>
///
/// The accuracy of the buoyancy calculations is determined by the accuracy of
/// the mesh used for the collision and the grid resolution used in the
/// wave field. There is of course a trade-off between a accuracy and
/// performance: A collision mesh containing between 200 - 1000 vertices
/// should run in real time in Gazebo.
///
/// The other forces modelled are less physically accurate and use game
/// developer techniques designed to provide a reasonably realistic simulation
/// of motion without excessive overhead.
///
/// Parameters are provided that allow these additional forces to be
/// toggled on or off.
///

#ifndef GZ_WAVES_PHYSICS_HH_
#define GZ_WAVES_PHYSICS_HH_

#include <memory>
#include <vector>

#include "gz/waves/CGALTypes.hh"

#include <gz/math/Pose3.hh>
#include <gz/msgs.hh>
#include <sdf/sdf.hh>

namespace gz
{
namespace waves
{

// class Grid;
class WavefieldSampler;

/// \brief A collection of static methods for various physics calculations.
class Physics
{
 public:
  /// \brief Compute the center of force for two parallel forces.
  ///
  /// Given two parallel forces with magnitudes fA and fB applied at
  /// points A and B, find the centre of force about which there is zero moment
  /// (i.e. mA + mB = (A - out) x FA + (B - out) x FB = 0).
  ///
  /// \param[in] _fA    The magnitude of the force at point A.
  /// \param[in] _fB    The magnitude of the force at point B.
  /// \param[in] _A     The point of application of force A.
  /// \param[in] _B     The point of application of force B.
  /// \return           The point at which the resultant force is applied
  ///                   with no moment.
  static cgal::Point3 CenterOfForce(
    double _fA, double _fB,
    const cgal::Point3& _A,
    const cgal::Point3& _B);

  /// \brief Compute the deep water dispersion.
  ///
  /// \param[in] _wavenumber  The wavenumber: k = 2 PI / wavelength.
  /// \return                 The angular frequency omega.
  static double DeepWaterDispersionToOmega(double _wavenumber);

  /// \brief Compute the deep water dispersion.
  ///
  /// \param[in] _omega       The angular frequency: omega = 2 PI / T.
  /// \return                 The wavenumber k.
  static double DeepWaterDispersionToWavenumber(double _omega);

  /// \brief Compute the viscous drag coefficient CF(Rn) using the
  ///        1957 ITTC formula.
  ///
  /// Set a lower limit on Rn to 1.0E+3 since the 1957 ITTC formula
  /// has a pole at Rn = 1.0E+2. For a 10m boat in salt water this
  /// corresponds to a velocity ~ 1.0E-5.
  ///
  /// \param[in] _Rn  The Reynolds number.
  /// return          The viscous drag coefficient.
  static double ViscousDragCoefficient(double _Rn);

  /// \brief Compute the centre of pressure for a triangle with horizontal
  ///        base and apex up.
  ///
  /// \param[in] _z0  The depth at H.z.
  /// \param[in] _H   The vertex with the greatest z-component.
  /// \param[in] _M   A base vertex with M.z < H.z.
  /// \param[in] _B   The midpoint of the base B.z = M.z.
  /// \return         The center of pressure.
  static cgal::Point3 CenterOfPressureApexUp(
    double _z0,
    const cgal::Point3& _H,
    const cgal::Point3& _M,
    const cgal::Point3& _B);

  /// \brief Compute the centre of pressure for a triangle with horizontal
  ///        base and apex down.
  ///
  /// \param[in] _z0  The depth at H.z.
  /// \param[in] _L   The vertex with the least z-component.
  /// \param[in] _M   A base vertex with L.z < M.z.
  /// \param[in] _B   The midpoint of the base B.z = M.z.
  /// \return         The center of pressure.
  static cgal::Point3 CenterOfPressureApexDn(
    double _z0,
    const cgal::Point3& _L,
    const cgal::Point3& _M,
    const cgal::Point3& _B);

  /// \brief Calculate the buoyancy force for a submerged triangle (H, M, L).
  //
  /// Note: depthC > 0 for submerged triangle.
  /// \param[in] _depthC  The depthC at the centroid C.
  /// \param[in] _C       The centroid of the triangle (H, M, L).
  /// \param[in] _H       High vertex.
  /// \param[in] _M       Mid vertex.
  /// \param[in] _L       Low vertex.
  /// \param[in] _normal  The triangle outward normal.
  /// \param[out] _center The resultant centre of pressure.
  /// \param[out] _force  The resultant force.
  static void BuoyancyForceAtCenterOfPressure(
    double _depthC,
    const cgal::Point3& _C,
    const cgal::Point3& _H,
    const cgal::Point3& _M,
    const cgal::Point3& _L,
    const cgal::Vector3& _normal,
    cgal::Point3& _center,
    cgal::Vector3& _force);

  /// \brief Calculate the buoyancy force at the centroid for a
  ///        submerged triangle.
  ///
  /// \param[in] _wavefieldSampler  A reference to a WaveSampler.
  /// \param[in] _triangle          The triangle for which the buoyancy is
  ///                               being calculated.
  /// \param[out] _center           The centroid, where the force is applied.
  /// \param[out] _force            The buoyancy force applied at the center.
  static void BuoyancyForceAtCentroid(
    const WavefieldSampler& _wavefieldSampler,
    const cgal::Triangle& _triangle,
    cgal::Point3& _center,
    cgal::Vector3& _force);

  /// \brief Calculate the buoyancy force and center of pressure for
  ///        a submerged triangle.
  ///
  /// \param[in] _wavefieldSampler  A reference to a WaveSampler.
  /// \param[in] _triangle          The triangle for which the buoyancy is
  ///                               being calculated.
  /// \param[out] _center           The center of pressure, where the force
  ///                               is applied.
  /// \param[out] _force            The buoyancy force applied at the center.
  static void BuoyancyForceAtCenterOfPressure(
    const WavefieldSampler& _wavefieldSampler,
    const cgal::Triangle& _triangle,
    cgal::Point3& _center,
    cgal::Vector3& _force);

  /// \brief Calculate the height map for each triangle vertex for a wavefield.
  ///
  /// \param[in] _wavefieldSampler  A reference to a WaveSampler.
  /// \param[in] _triangle          The triangle used to compute the height map.
  /// \return                       An array of three doubles, the height for
  ///                               each vertex.
  static std::array<double, 3> ComputeHeightMap(
    const WavefieldSampler& _wavefieldSampler,
    const cgal::Triangle& _triangle);
};

//////////////////////////////////////////////////
/// \internal Hold private data for HydrodynamicsParameters.
class HydrodynamicsParametersPrivate;

/// \brief A class to manage the parameters used in hydrodynamics calculations.
class HydrodynamicsParameters
{
 public:
  /// \brief Destructor.
  ~HydrodynamicsParameters();

  /// \brief Constructor.
  HydrodynamicsParameters();

  /// \brief True if damping is enabled.
  bool DampingOn() const;

  /// \brief True if viscous drag is enabled.
  bool ViscousDragOn() const;

  /// \brief True if pressure drag is enabled.
  bool PressureDragOn() const;

  /// \brief The linear damping coefficient for linear montion.
  double CDampL1() const;

  /// \brief The quadratic damping coefficient for linear montion.
  double CDampL2() const;

  /// \brief The linear damping coefficient for angular montion.
  double CDampR1() const;

  /// \brief The quadratic damping coefficient for angular montion.
  double CDampR2() const;

  /// \brief The linear coefficient for positive pressure drag.
  double CPDrag1() const;

  /// \brief The quadratic coefficient for positive pressure drag.
  double CPDrag2() const;

  /// \brief The exponent coefficient for positive pressure drag.
  double FPDrag() const;

  /// \brief The linear coefficient for negative pressure drag.
  double CSDrag1() const;

  /// \brief The quadratic coefficient for negative pressure drag.
  double CSDrag2() const;

  /// \brief The exponent coefficient for negative pressure drag.
  double FSDrag() const;

  /// \brief The reference speed for pressure drag.
  double VRDrag() const;

  /// \brief Set the parameters from a message.
  ///
  /// \param[in] _msg   The message containing the hydrodynamics parameters.
  void SetFromMsg(const msgs::Param_V& _msg);

  /// \brief Set parameters from a SDF tree.
  ///
  /// \param[in] _sdf   A reference to a SDF element.
  void SetFromSDF(sdf::Element& _sdf);

  /// \brief Print a summary of the hydrodynamics parameters to the msg stream.
  void DebugPrint() const;

 private:
  /// \internal Private implementation.
  std::shared_ptr<HydrodynamicsParametersPrivate> data;
};

typedef std::shared_ptr<HydrodynamicsParameters> HydrodynamicsParametersPtr;

//////////////////////////////////////////////////
/// \internal Hold triangle data for hydrodynamics calculations.
class TriangleProperties;

/// \internal
/// \brief Class to hold private data for Hydrodynamics.
class HydrodynamicsPrivate;

/// \brief A class to manage hydrodynamics calculation for a rigid body
///        defined by a mesh.
class Hydrodynamics
{
 public:
  /// \brief Constructor
  ///
  /// \param[in] _params            The hydrodynamics parameters.
  /// \param[in] _linkMesh          The surface mesh for the rigid body.
  /// \param[in] _wavefieldSampler  An object for sampling the wave field.
  Hydrodynamics(
    std::shared_ptr<const HydrodynamicsParameters> _params,
    std::shared_ptr<const cgal::Mesh> _linkMesh,
    std::shared_ptr<const WavefieldSampler> _wavefieldSampler);

  /// \brief Update the wavefield sampler given the motion of the rigid body.
  ///
  /// The position, linear velocity and angular velocity of the rigid body
  /// center of mass must all be specified in the world frame.
  ///
  /// \param[in] _wavefieldSampler  An object for sampling the wave field.
  /// \param[in] _position          The position of the center of mass.
  /// \param[in] _linVelocity       The linear velocity of the center of mass.
  /// \param[in] _angVelocity       The angular velocity of the center of mass.
  void Update(
    std::shared_ptr<const WavefieldSampler> _wavefieldSampler,
    const math::Pose3d& _pose,
    const cgal::Vector3& _linVelocity,
    const cgal::Vector3& _angVelocity);

  /// \brief Compute the hydrostatic and hydrodynamic forces.
  ///
  /// \return The force in the world frame.
  const cgal::Vector3& Force() const;

  /// \brief Compute the hydrostatic and hydrodynamic torques.
  ///
  /// \return The torque in the world frame.
  const cgal::Vector3& Torque() const;

  /// \brief The current waterline.
  ///
  /// \return A vector containing Line elements that comnprise the waterline.
  const std::vector<cgal::Line>& GetWaterline() const;

  /// \brief The current list of submerged triangles.
  ///
  /// \return A vector containing the trianges that are under water.
  const std::vector<cgal::Triangle>& GetSubmergedTriangles() const;

 private:
  /// \internal
  /// \brief Update the list of submerged triangles.
  void UpdateSubmergedTriangles();

  /// internal
  /// \brief Determine the submerged sub-triangle of a triangle given a
  ///        height map for it's vertices.
  ///
  /// \param[in] _triangle  The triangle to test whether it is submerged
  ///                       and split if needed.
  /// \param[out] _triProps The computed properties for the input triangle.
  void PopulateSubmergedTriangle(
    const cgal::Triangle& _triangle,
    TriangleProperties& _triProps);

  /// internal
  /// \brief Split a triangle with one submerged vertex.
  ///
  /// \param[in] _triProps The properties for the partially submerged triangle.
  void SplitPartiallySubmergedTriangle1(TriangleProperties& _triProps);

  /// internal
  /// \brief Split a triangle with two submerged vertices.
  ///
  /// \param[in] _triProps The properties for the partially submerged triangle.
  void SplitPartiallySubmergedTriangle2(TriangleProperties& _triProps);

  /// internal
  /// \brief Add a fully submerged triangle.
  ///
  /// \param[in] _triProps The properties for the fully submerged triangle.
  void AddFullySubmergedTriangle(TriangleProperties& _triProps);

  /// internal
  /// \brief Surface and submerged surface area.
  void ComputeAreas();

  /// internal
  /// \brief Waterline length calculation.
  void ComputeWaterlineLength();

  /// internal
  /// \brief Calculate normal and tangential velocities for
  ///        each submerged triangle.
  void ComputePointVelocities();

  /// internal
  // \breif Compute the Reynolds number.
  double ComputeReynoldsNumber() const;

  /// internal
  /// \brief Buoyancy force calculation.
  void ComputeBuoyancyForce();

  /// internal
  /// \brief Damping force calculation.
  void ComputeDampingForce();

  /// internal
  /// \brief Viscous drag force calculation.
  void ComputeViscousDragForce();

  /// internal
  /// \brief 'Pressure drag' force calculation.
  void ComputePressureDragForce();

  /// \internal
  /// \brief Pointer to the class private data.
  std::shared_ptr<HydrodynamicsPrivate> data;
};

typedef std::shared_ptr<Hydrodynamics> HydrodynamicsPtr;

}  // namespace waves
}  // namespace gz

#endif  // GZ_WAVES_PHYSICS_HH_
