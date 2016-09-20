FILE(REMOVE_RECURSE
  "libcryptopp.pdb"
  "libcryptopp.so"
  "libcryptopp.so.5.6"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/cryptopp-shared.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
