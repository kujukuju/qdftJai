//
// Created by Kuju on 5/23/2025.
//

#include "qdft_c.h"

#include "../cpp/src/qdft/qdft.h"

QDFT create_qdft(double sample_rate, double low_freq, double high_freq, double bins_per_octave, double quality, double latency) {
    return new qdft::QDFT(sample_rate, std::pair<double, double>(low_freq, high_freq), bins_per_octave, quality, latency);
}

void delete_qdft(QDFT qdft) {
    delete ((qdft::QDFT<float, double>*) qdft);
}

int64_t get_bins(QDFT qdft) {
    return (int64_t) ((qdft::QDFT<float, double>*) qdft)->size();
}

void process_sample(QDFT qdft, float input, Complex* output) {
    ((qdft::QDFT<float, double>*) qdft)->qdft(input, (std::complex<double>*) output);
}

void process_samples(QDFT qdft, int64_t num_samples, float* input, Complex* output) {
    ((qdft::QDFT<float, double>*) qdft)->qdft(num_samples, input, (std::complex<double>*) output);
}

float invert_sample(QDFT qdft, Complex* output) {
    return ((qdft::QDFT<float, double>*) qdft)->iqdft((std::complex<double>*) output);
}

void invert_samples(QDFT qdft, int64_t num_samples, Complex* input, float* output) {
    ((qdft::QDFT<float, double>*) qdft)->iqdft(num_samples, (std::complex<double>*) input, output);
}
