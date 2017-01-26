//
//  StreamViewController.swift
//  YadioApp
//
//  Created by yaser on 1/25/17.
//  Copyright © 2017 Yadio. All rights reserved.
//

import Foundation
import UIKit
import Jukebox
import MediaPlayer

class StreamViewController: UIViewController,JukeboxDelegate {
    
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var Indicator: UIActivityIndicatorView!
    @IBOutlet weak var playPauseButton: UIButton!
    
    @IBOutlet weak var centerContainer: UIView!
    var jukebox : Jukebox!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       configureUI()
        
        UIApplication.shared.beginReceivingRemoteControlEvents()
        
        // configure jukebox
        jukebox = Jukebox(delegate: self, items: [
            JukeboxItem(URL: URL(string: "http://dl.irmp3.ir/data/song/Salar_Aghili-Hamaseye_Basirat-(IRMP3.IR).mp3")!),
            JukeboxItem(URL: URL(string: "http://dl.irmp3.ir/data/song/Salar_Aghili-Khoosheh_Chin-(WWW.IRMP3.IR).mp3")!),
            JukeboxItem(URL: URL(string: "http://dl.irmp3.ir/data/song/Habib-Marde_Tanhaye_Shab-(WWW.IRMP3.IR).mp3")!)
            ])!
    }
    
    func configureUI ()
    {
        resetUI()
        slider.setThumbImage(UIImage(named: "sliderThumb"), for: UIControlState())
        centerContainer.layer.cornerRadius = 12
        view.backgroundColor = UIColor.black
    }

    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    // MARK:- JukeboxDelegate -
    
    func jukeboxDidLoadItem(_ jukebox: Jukebox, item: JukeboxItem) {
        print("Jukebox did load: \(item.URL.lastPathComponent)")
    }
    
    func jukeboxPlaybackProgressDidChange(_ jukebox: Jukebox) {
        
        if let currentTime = jukebox.currentItem?.currentTime, let duration = jukebox.currentItem?.meta.duration {
            let value = Float(currentTime / duration)
            slider.value = value
            populateLabelWithTime(currentTimeLabel, time: currentTime)
            populateLabelWithTime(durationLabel, time: duration)
        } else {
            resetUI()
        }
    }
    
    func jukeboxStateDidChange(_ jukebox: Jukebox) {
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.Indicator.alpha = jukebox.state == .loading ? 1 : 0
            self.playPauseButton.alpha = jukebox.state == .loading ? 0 : 1
            self.playPauseButton.isEnabled = jukebox.state == .loading ? false : true
        })
        
        if jukebox.state == .ready {
            playPauseButton.setImage(UIImage(named: "playBtn"), for: UIControlState())
        } else if jukebox.state == .loading  {
            playPauseButton.setImage(UIImage(named: "pauseBtn"), for: UIControlState())
        } else {
            volumeSlider.value = jukebox.volume
            let imageName: String
            switch jukebox.state {
            case .playing, .loading:
                imageName = "pauseBtn"
            case .paused, .failed, .ready:
                imageName = "playBtn"
            }
            playPauseButton.setImage(UIImage(named: imageName), for: UIControlState())
        }
        
        print("Jukebox state changed to \(jukebox.state)")
    }
    
    func jukeboxDidUpdateMetadata(_ jukebox: Jukebox, forItem: JukeboxItem) {
        print("Item updated:\n\(forItem)")
    }
    
    override func remoteControlReceived(with event: UIEvent?) {
        if event?.type == .remoteControl {
            switch event!.subtype {
            case .remoteControlPlay :
                jukebox.play()
            case .remoteControlPause :
                jukebox.pause()
            case .remoteControlNextTrack :
                jukebox.playNext()
            case .remoteControlPreviousTrack:
                jukebox.playPrevious()
            case .remoteControlTogglePlayPause:
                if jukebox.state == .playing {
                    jukebox.pause()
                } else {
                    jukebox.play()
                }
            default:
                break
            }
        }
    }

    @IBOutlet weak var volumeSlider: UISlider!
    @IBAction func volumeSliderValueChanged(_ sender: Any) {
        if let jk = jukebox {
            jk.volume = volumeSlider.value
        }
    }
    
    @IBOutlet weak var slider: UISlider!
    @IBAction func progressSliderValueChanged(_ sender: Any) {
        if let duration = jukebox.currentItem?.meta.duration {
            jukebox.seek(toSecond: Int(Double(slider.value) * duration))
        }
    }
    
    
    @IBAction func prevAction(_ sender: Any) {
        if let time = jukebox.currentItem?.currentTime, time > 5.0 || jukebox.playIndex == 0 {
            jukebox.replayCurrentItem()
        } else {
            jukebox.playPrevious()
        }
    }
    
    @IBAction func nextAction(_ sender: Any) {
         jukebox.playNext()
    }
    
    @IBAction func playPauseAction(_ sender: Any) {
        switch jukebox.state {
        case .ready :
            jukebox.play(atIndex: 0)
        case .playing :
            jukebox.pause()
        case .paused :
            jukebox.play()
        default:
            jukebox.stop()
        }
    }
    
    @IBAction func replayAction(_ sender: Any) {
        resetUI()
        jukebox.replay()
    }
    
    @IBAction func stopAction(_ sender: Any) {
        resetUI()
        jukebox.stop()

    }
    
    // MARK:- Helpers -
    
    func populateLabelWithTime(_ label : UILabel, time: Double) {
        let minutes = Int(time / 60)
        let seconds = Int(time) - minutes * 60
        
        label.text = String(format: "%02d", minutes) + ":" + String(format: "%02d", seconds)
    }
    
    func resetUI()
    {
        durationLabel.text = "00:00"
        currentTimeLabel.text = "00:00"
        slider.value = 0
    }
    
    
    
}
