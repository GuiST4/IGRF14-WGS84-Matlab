#include <stdio.h>
#include "igrf.h"

int main()
{
    // Test parameters
    igrf_input_t in = {
        .lat_deg = 40.0f,
        .lon_deg = 60.0f,
        .alt_m = 500000.0f, // 500 km
        .year = 2025.0f};

    igrf_output_t out;
    printf("Running IGRF-14 C Implementation...\n");
    printf("Inputs: Lat=%.2f, Lon=%.2f, Alt=%.0fm, Year=%.1f\n",
           in.lat_deg, in.lon_deg, in.alt_m, in.year);

    igrf_compute(&in, &out);

    printf("--------------------------------\n");
    printf("B_North: %10.4f nT\n", out.B_north);
    printf("B_East:  %10.4f nT\n", out.B_east);
    printf("B_Down:  %10.4f nT\n", out.B_down);
    printf("F_Total: %10.4f nT\n", out.F_total);
    printf("--------------------------------\n");

    return 0;
}