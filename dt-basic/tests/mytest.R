app <- ShinyDriver$new("..")
app$snapshotInit("mytest")

# Add a pause because slow, heavily-loaded CI platforms may need extra time
# before taking the first snapshot.
Sys.sleep(1)

# Input 'dt_rows_selected' was set, but doesn't have an input binding.
# Input 'dt_rows_current' was set, but doesn't have an input binding.
# Input 'dt_rows_all' was set, but doesn't have an input binding.
# Input 'dt_state' was set, but doesn't have an input binding.
# Input 'dt_search' was set, but doesn't have an input binding.
# Input 'dt_cell_clicked' was set, but doesn't have an input binding.
# Input 'dt_rows_current' was set, but doesn't have an input binding.
# Input 'dt_rows_all' was set, but doesn't have an input binding.
app$snapshot()
# Input 'dt_cell_clicked' was set, but doesn't have an input binding.
# Input 'dt_rows_selected' was set, but doesn't have an input binding.
# Input 'dt_row_last_clicked' was set, but doesn't have an input binding.
# Input 'dt_cell_clicked' was set, but doesn't have an input binding.
# Input 'dt_rows_selected' was set, but doesn't have an input binding.
# Input 'dt_row_last_clicked' was set, but doesn't have an input binding.
# Input 'dt_cell_clicked' was set, but doesn't have an input binding.
# Input 'dt_rows_selected' was set, but doesn't have an input binding.
# Input 'dt_row_last_clicked' was set, but doesn't have an input binding.
# Input 'dt_rows_current' was set, but doesn't have an input binding.
# Input 'dt_cell_clicked' was set, but doesn't have an input binding.
# Input 'dt_rows_selected' was set, but doesn't have an input binding.
# Input 'dt_row_last_clicked' was set, but doesn't have an input binding.
app$snapshot()
# Input 'dt_rows_current' was set, but doesn't have an input binding.
app$snapshot()
