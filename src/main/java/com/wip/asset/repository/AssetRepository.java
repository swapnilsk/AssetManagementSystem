package com.wip.asset.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.wip.asset.model.Asset;

public interface AssetRepository extends JpaRepository<Asset, Long> {
    Asset findByModelName(String modelName);
}
