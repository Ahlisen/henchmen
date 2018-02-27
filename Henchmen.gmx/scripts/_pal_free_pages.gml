///_pal_free_pages()

ds_foreach( sPal_indexedPages, ds_type_map, false, _pal_page_destroy );
ds_map_destroy( sPal_indexedPages );
