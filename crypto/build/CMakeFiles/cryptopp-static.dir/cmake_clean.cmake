FILE(REMOVE_RECURSE
  "libcryptopp.pdb"
  "libcryptopp.a"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/cryptopp-static.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
