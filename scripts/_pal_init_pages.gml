///_pal_init_pages()

globalvar sPal_indexedPages;
// texture -> indexed page
// It does not work properly at the EA v1.99.420 yet. It's made for the future. There is only 1 indexed page with key = 0 now
sPal_indexedPages = ds_map_create();
