use ".."
use "ponybench"

actor Main is BenchmarkList
    new create(env: Env) =>
        PonyBench(env, this)

    fun tag benchmarks(bench: PonyBench) =>
        bench(_HTTPParserBench)

class iso _HTTPParserBench is MicroBenchmark
    """
    Benchmarks HTTP Parser
    Reference Issue: https://github.com/ponylang/http/issues/1
    """
    fun name(): String => "_HTTPParser"

    fun apply() =>
        // prevent compiler from optimizing out this operation
        DoNotOptimise[None](None)
        DoNotOptimise.observe()