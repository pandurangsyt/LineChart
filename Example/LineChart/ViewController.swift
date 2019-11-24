//
//  ViewController.swift
//  LineChart
//
//  Created by pandurangsyt on 11/24/2019.
//  Copyright (c) 2019 pandurangsyt. All rights reserved.
//

import UIKit
import LineChart

class ViewController: UIViewController {

    @IBOutlet var lineChartView: LineChart!
    @IBOutlet var tappedValue: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tappedValue.isHidden = true
        setupLineChart()
    }
    
    func setupLineChart() {
        let data: [Double] = [1200, 1000, 1500, 1800, 1700, 1750]
        let xLabels: [String] = ["2012", "2013", "2014", "2016", "2017", "2018"]
        lineChartView.delegate = self
        lineChartView.animation.enabled = true
        lineChartView.area = true
        lineChartView.curved = false
        lineChartView.x.labels.visible = true
        lineChartView.x.grid.count = Double(xLabels.count)
        lineChartView.x.axis.margin = 50
        lineChartView.y.axis.margin = 50
        lineChartView.x.labels.values = xLabels
        lineChartView.y.labels.visible = true
        lineChartView.chartColors = [LineColor(lineColor: .green, areaColor: .orange, dotColor: .red)]
        let max = data.max() ?? 100
        let min = data.min() ?? 0
        let yGrid = (max - min) / 7
        lineChartView.y.grid.count = yGrid
        lineChartView.y.end = max  + yGrid * 2
        lineChartView.y.start = min - yGrid
        lineChartView.y.unitCall = "$"
        lineChartView.addLine(data)
    }
}

extension ViewController: LineChartDelegate {
    func didSelectDotData(_ x: Int, yValues: [Double]) {
        tappedValue.isHidden = false
        tappedValue.text = String(yValues.first ?? 0)
    }
    
    func didSelectDotPoint(_ pos: CGPoint) {
        
    }
}
