function update_index_in(string) {
  return(string.replace(/_INDEX_/g, new Date().getTime()));
}
