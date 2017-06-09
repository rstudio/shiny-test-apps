app <- ShinyDriver$new("..")
app$snapshotInit("mytests")

app$snapshot()
app$setInputs(add = "click")
# Input '`slider-1_rows_selected`' was set, but doesn't have an input binding.
# Input '`slider-1_rows_current`' was set, but doesn't have an input binding.
# Input '`slider-1_rows_all`' was set, but doesn't have an input binding.
# Input '`slider-1_state`' was set, but doesn't have an input binding.
# Input '`slider-1_search`' was set, but doesn't have an input binding.
# Input '`slider-1_cell_clicked`' was set, but doesn't have an input binding.
# Input '`slider-1_cell_clicked`' was set, but doesn't have an input binding.
# Input '`slider-1_rows_selected`' was set, but doesn't have an input binding.
# Input '`slider-1_row_last_clicked`' was set, but doesn't have an input binding.
# Input '`slider-1_cell_clicked`' was set, but doesn't have an input binding.
# Input '`slider-1_rows_selected`' was set, but doesn't have an input binding.
# Input '`slider-1_row_last_clicked`' was set, but doesn't have an input binding.
app$snapshot()
app$setInputs(add = "click")
app$setInputs(DataTables_Table_0_length = "10")
# Input '`slider-2_rows_selected`' was set, but doesn't have an input binding.
# Input '`slider-2_rows_current`' was set, but doesn't have an input binding.
# Input '`slider-2_rows_all`' was set, but doesn't have an input binding.
# Input '`slider-2_state`' was set, but doesn't have an input binding.
# Input '`slider-2_search`' was set, but doesn't have an input binding.
# Input '`slider-2_cell_clicked`' was set, but doesn't have an input binding.
# Input '`slider-2_cell_clicked`' was set, but doesn't have an input binding.
# Input '`slider-2_rows_selected`' was set, but doesn't have an input binding.
# Input '`slider-2_row_last_clicked`' was set, but doesn't have an input binding.
app$snapshot()
app$setInputs(add = "click")
app$setInputs(DataTables_Table_1_length = "10")
# Input '`slider-3_rows_selected`' was set, but doesn't have an input binding.
# Input '`slider-3_rows_current`' was set, but doesn't have an input binding.
# Input '`slider-3_rows_all`' was set, but doesn't have an input binding.
# Input '`slider-3_state`' was set, but doesn't have an input binding.
# Input '`slider-3_search`' was set, but doesn't have an input binding.
# Input '`slider-3_cell_clicked`' was set, but doesn't have an input binding.
# Input '`slider-1_cell_clicked`' was set, but doesn't have an input binding.
# Input '`slider-1_rows_selected`' was set, but doesn't have an input binding.
# Input '`slider-1_row_last_clicked`' was set, but doesn't have an input binding.
# Input '`slider-2_cell_clicked`' was set, but doesn't have an input binding.
# Input '`slider-2_rows_selected`' was set, but doesn't have an input binding.
app$snapshot()
# Input '`slider-1_rows_current`' was set, but doesn't have an input binding.
# Input '`slider-1_rows_all`' was set, but doesn't have an input binding.
# Input '`slider-1_search`' was set, but doesn't have an input binding.
# Input '`slider-1_search`' was set, but doesn't have an input binding.
app$snapshot()

app$snapshotCompare()
