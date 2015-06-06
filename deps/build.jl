using BinDeps

@BinDeps.setup

using Compat

group = library_group("groonga")

deps = [
    groonga = library_dependency("groonga", aliases = ["libgroonga0", "libgroonga","libgroonga.so.0"], depends = [], group = group)
]

provides(AptGet,
    @compat Dict(
        "libgroonga0" => groonga
    ))

const version = "5.0.4"

provides(Sources,
    @compat Dict(
         URI("http://packages.groonga.org/source/groonga/groonga-$(version).tar.gz") => groonga
    ))

prefix = joinpath(BinDeps.depsdir(groonga), "usr")
srcdir = joinpath(BinDeps.depsdir(groonga), "src", "groonga-$(version)")

provides(SimpleBuild,
    (@build_steps begin
        GetSources(groonga)
        @build_steps begin
            ChangeDirectory(srcdir)
            `./configure --prefix=$prefix`
            `make`
            `make install`
        end
     end), groonga, os = :Unix)

@BinDeps.install [:groonga => :libgroonga]
