// Thin wrappers exposing the C3 rapidhash port to the C bench harness.
// Each one conforms to BMK_benchFn_t, see benchfn.h.
// The calls are inlined because the C wrappers inline too, which folds the seed mix for the
// constant seed. Without it C3 pays an extra multiply per call that C does not.
module rapidhash_bench;
import std::hash::rapidhash;

fn usz hash_wrapper(void* src, usz size, void* dst, usz capacity, void* payload) @export("rapidhashC3_wrapper")
{
	return (usz)rapidhash::hash(((char*)src)[:size]) @inline;
}

fn usz micro_wrapper(void* src, usz size, void* dst, usz capacity, void* payload) @export("rapidhashMicroC3_wrapper")
{
	return (usz)rapidhash::micro(((char*)src)[:size]) @inline;
}

fn usz nano_wrapper(void* src, usz size, void* dst, usz capacity, void* payload) @export("rapidhashNanoC3_wrapper")
{
	return (usz)rapidhash::nano(((char*)src)[:size]) @inline;
}
