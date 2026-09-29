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
local popup_preview_lsp = require("popup_preview.nvimlsp")
local get_resolved_item = popup_preview_lsp.get_resolved_item
popup_preview_lsp.get_resolved_item = function(arg)
    if #vim.lsp.get_clients({ bufnr = 0, method = "completionItem/resolve" }) == 0 then
        vim.fn["popup_preview#doc#close_floating"]()
        return
    end
    return get_resolved_item(arg)
end

vim.fn["popup_preview#enable"]()
