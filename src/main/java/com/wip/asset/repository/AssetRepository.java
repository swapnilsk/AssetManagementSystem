package com.wip.asset.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.wip.asset.model.Asset;

public interface AssetRepository extends JpaRepository<Asset, String> {
    //TODO Remove this code before final submission
    //Asset findByModelName(String modelName);
}
