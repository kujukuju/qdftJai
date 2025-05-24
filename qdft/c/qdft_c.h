//
// Created by Kuju on 5/23/2025.
//

#pragma once

#include <complex>

#ifdef _WIN32
#define EXPORT extern "C" __declspec(dllexport)
#else
#define EXPORT extern "C"
#endif

struct Complex {
    double r;
    double i;
};

static_assert(sizeof(Complex) == sizeof(std::complex<double>), "Complex struct and standard complex have different sizes.");

typedef void* QDFT;

EXPORT QDFT create_qdft(double sample_rate, double low_freq, double high_freq, double bins_per_octave, double quality, double latency);

EXPORT void delete_qdft(QDFT qdft);

EXPORT int64_t get_bins(QDFT qdft);

EXPORT void process_sample(QDFT qdft, float input, Complex* output);

EXPORT void process_samples(QDFT qdft, int64_t num_samples, float* input, Complex* output);

EXPORT float invert_sample(QDFT qdft, Complex* output);

EXPORT void invert_samples(QDFT qdft, int64_t num_samples, Complex* input, float* output);