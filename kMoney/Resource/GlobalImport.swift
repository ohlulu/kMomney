//
//  GlobalImport.swift
//  kMoney
//
//  Created by ohlulu on 2019/4/14.
//  Copyright © 2019 ohlulu. All rights reserved.
//

@_exported import SnapKit
@_exported import RxCocoa
@_exported import RxSwift
@_exported import OhSwifter
@_exported import RxGesture
@_exported import RxDataSources


typealias RxTableDataSource = RxTableViewSectionedReloadDataSource
typealias RxAnimatedTableDataSource = RxTableViewSectionedAnimatedDataSource
typealias RxCollectionDataSource = RxCollectionViewSectionedReloadDataSource

let RxMainThread = MainScheduler.instance
let RxAsyncThread = MainScheduler.asyncInstance
