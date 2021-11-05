using ComplexDiff
using Documenter

DocMeta.setdocmeta!(ComplexDiff, :DocTestSetup, :(using ComplexDiff); recursive=true)

makedocs(;
    modules=[ComplexDiff],
    authors="Qingyu Qu",
    repo="https://github.com/ErikQQY/ComplexDiff.jl/blob/{commit}{path}#{line}",
    sitename="ComplexDiff.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://ErikQQY.github.io/ComplexDiff.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/ErikQQY/ComplexDiff.jl",
    devbranch="main",
)
