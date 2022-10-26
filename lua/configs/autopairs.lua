local status, autopairs = pcall(require, "nvim-autopairs")
if not status then
	return
end

autopairs.setup({
	check_ts = true,
	ts_config = {
		lua = { "string " },
		javascript = { "template_string" },
	},
})

local cmp_autopairs_status, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not cmp_autopairs_status then
	return
end

local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
	return
end

-- Inserts `(` after a function or method
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
