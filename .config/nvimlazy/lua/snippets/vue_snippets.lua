local ls = require("luasnip")

ls.snippets = {
	vue = {
		ls.parser.parse_snippet("props", "const props = withDefault(defineProps<{}>(), {});"),
	},
}
