package com.teleexpertise.app.domain.repository;

import java.util.List;
import java.util.Optional;

public interface RecordRepository {

    public Optional<Record> findById(Integer id);
    public List<Record> findAll();
    public Optional<Record> findByName(String name);
    public Record save(Record record);
    public void deleteById(Integer id);
    public boolean existsById(Integer id);
    public boolean existsByName(String name);
    public Record update(Record record);
}
