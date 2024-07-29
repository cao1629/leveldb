#include <iostream>
#include "leveldb/db.h"

int main() {
  leveldb::DB *db;
  leveldb::Options options;
  options.create_if_missing = true;
  leveldb::Status status = leveldb::DB::Open(options, "/tmp/testdb", &db);

  db->Put(leveldb::WriteOptions(), "aaa", "bbb");

  std::string res;
  db->Get(leveldb::ReadOptions(), "aaa", &res);
  std::cout << res << std::endl;

  delete db;
}