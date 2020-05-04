//
//  ViewController.swift
//  DSWaveformImageExample
//
//  Created by Dennis Schmidt on 06/02/2017.
//  Copyright © 2017 Dennis Schmidt. All rights reserved.
//

import UIKit
import DSWaveformImage

class ViewController: UIViewController {
    @IBOutlet weak var middleWaveformView: UIImageView!

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let waveformImageDrawer = WaveformImageDrawer()
        let audioURL = Bundle.main.url(forResource: "example_sound", withExtension: "m4a")!

        // always uses background thread rendering
        waveformImageDrawer.waveformImage(fromAudioAt: audioURL,
                                          size: middleWaveformView.bounds.size,
                                          style: .striped,
                                          position: .middle) { image in

            // need to jump back to main queue
            DispatchQueue.main.async {
                let template = image?.withRenderingMode(.alwaysTemplate)
                self.middleWaveformView.tintColor = .systemPurple
                self.middleWaveformView.image = template
            }
        }



    }
}

