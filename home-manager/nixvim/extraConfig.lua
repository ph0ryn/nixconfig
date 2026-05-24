vim.fn["ddc#custom#patch_global"]("ui", "native")
vim.fn["ddc#custom#patch_global"]("sources", {"lsp", "around", "file"})
vim.fn["ddc#custom#patch_global"]("sourceOptions", {
    _ = {
        matchers = {'matcher_head'},
        sorters = {"sorter_rank"}
    },
    lsp = {
        isVolatile = true,
        mark = "lsp",
        forceCompletionPattern = [[\.\w*|:\w*|->\w*]]
    },
    around = {
        mark = "A"
    },
    file = {
        isVolatile = true,
        mark = "F",
        forceCompletionPattern = [[\S/\S*]]
    }
})
vim.fn["ddc#custom#patch_global"]("sourceParams", {
    lsp = {
        enableResolveItem = true,
        enableAdditionalTextEdit = true
    },
    around = {
        maxSize = 500
    }
})

vim.fn["ddc#enable"]()

vim.lsp.config("*", {
    capabilities = require("ddc_source_lsp").make_client_capabilities()
})

vim.fn["signature_help#enable"]()
vim.g.signature_help_config = {
    contentsStyle = "full",
    viewStyle = "floating"
}
vim.fn["popup_preview#enable"]()
