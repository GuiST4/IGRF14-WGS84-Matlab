#ifndef IGRF_H
#define IGRF_H

// Constants
#define IGRF_N 13   // Degree
#define IGRF_DIM 14 // N+1 (Matrix Dimension)

// Input Structure (Geodetic Coordinates LLA)
typedef struct
{
    float lat_deg; // Latitude (-90 to 90)
    float lon_deg; // Longitude (-180 to 180)
    float alt_m;   // Altitude above WGS84 Ellipsoid (meters)
    float year;    // Decimal year
} igrf_input_t;

// Output Structure (NED Reference Frame)
typedef struct
{
    float B_north; // North (nT)
    float B_east;  // East  (nT)
    float B_down;  // Down  (nT)
    float F_total; // Total Intensity (nT)
} igrf_output_t;

/**
 * @brief Computes the Earth's magnetic field vector (IGRF-14).
 * @param in Pointer to input coordinates.
 * @param out Pointer to output structure to be filled.
 */
void igrf_compute(const igrf_input_t *in, igrf_output_t *out);

#endif // IGRF_H