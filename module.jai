//
// This file was auto-generated using the following command:
//
// jai ./generate.jai
//



QDFTComplex :: struct {
    r: float64;
    i: float64;
}

QDFT :: *void;

create_qdft :: (sample_rate: float64, low_freq: float64, high_freq: float64, bins_per_octave: float64, quality: float64, latency: float64) -> QDFT #foreign qdft;

delete_qdft :: (qdft: QDFT) -> void #foreign qdft;

get_bins :: (qdft: QDFT) -> s64 #foreign qdft;

process_sample :: (qdft: QDFT, input: float, output: *QDFTComplex) -> void #foreign qdft;

process_samples :: (qdft: QDFT, num_samples: s64, input: *float, output: *QDFTComplex) -> void #foreign qdft;

invert_sample :: (qdft: QDFT, output: *QDFTComplex) -> float #foreign qdft;

invert_samples :: (qdft: QDFT, num_samples: s64, input: *QDFTComplex, output: *float) -> void #foreign qdft;

#scope_file

#import "Basic"; // For assert

qdft :: #library "bin/win/qdft";

#run {
    {
        info := type_info(QDFTComplex);
        for info.members {
            if it.name == {
                case "r";
                    assert(it.offset_in_bytes == 0, "QDFTComplex.r has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QDFTComplex.r has unexpected size % instead of 8", it.type.runtime_size);
                case "i";
                    assert(it.offset_in_bytes == 8, "QDFTComplex.i has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QDFTComplex.i has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(QDFTComplex) == 16, "QDFTComplex has size % instead of 16", size_of(QDFTComplex));
    }
}

