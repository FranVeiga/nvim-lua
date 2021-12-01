-- H and L to move between buffers
Map('n', '<S-h>', '<cmd>BufferPrevious<cr>')
Map('n', '<S-l>', '<cmd>BufferNext<cr>')

Map('n', '<A-<>', ':BufferMovePrevious<CR>')
Map('n', '<A->>', ' :BufferMoveNext<CR>')


-- Alt + number to move to buffer
Map('n', '<A-1>', ':BufferGoto 1<CR>')
Map('n', '<A-2>', ':BufferGoto 2<CR>')
Map('n', '<A-3>', ':BufferGoto 3<CR>')
Map('n', '<A-4>', ':BufferGoto 4<CR>')
Map('n', '<A-5>', ':BufferGoto 5<CR>')
Map('n', '<A-6>', ':BufferGoto 6<CR>')
Map('n', '<A-7>', ':BufferGoto 7<CR>')
Map('n', '<A-8>', ':BufferGoto 8<CR>')
Map('n', '<A-9>', ':BufferGoto 9<CR>')
Map('n', '<A-0>', ':BufferLast<CR>')

-- Options

vim.g.bufferline = {
    auto_hide = true,
    exclude_ft = {'help'},
    icon_custom_colors = true,
}
