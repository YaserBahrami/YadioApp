//
//  DetailViewController.swift
//  YadioApp
//
//  Created by yaser on 1/21/17.
//  Copyright © 2017 Yadio. All rights reserved.
//

import UIKit
import AVFoundation
import Alamofire

class DetailViewController: UIViewController {
    
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var musicImage: UIImageView!
    @IBOutlet weak var musicTime: UILabel!
    @IBOutlet weak var downloadingLabel: UILabel!
    @IBOutlet weak var playIcon: UIBarButtonItem!
    @IBOutlet weak var toolbar: UIToolbar!
    
    var audioPlayer:AVAudioPlayer!
    var myMusic = Music()
    var sliderTimer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        author.text = myMusic.author
        name.text = myMusic.name
        
        changeToPauseButton()
        toolbar.items?[4].isEnabled = false
        toolbar.items?[8].isEnabled = false
        slider.value = 0
        slider.isEnabled = false
        downloadFileFromURL(url: URL(string: myMusic.uri)!)
    }
    

    
    @IBAction func playMusic(_ sender: UIBarButtonItem) {

        if audioPlayer.isPlaying {
            audioPlayer.pause()
            
            changeToPlayButton()
            
        }
        else{
            audioPlayer.play()
            changeToPauseButton()
        }
    }
    
    @IBAction func repeatMusic(_ sender: UIBarButtonItem) {
        
        audioPlayer.stop()
        audioPlayer.currentTime = 0
        audioPlayer.play()
        slider.value = 0
        changeToPauseButton()
        
        currentTime = 0
        
    }
    
    @IBOutlet weak var slider: UISlider!
    

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        audioPlayer.currentTime = TimeInterval(sender.value)
        audioPlayer.play()
        currentTime = Int(slider.value)
        changeToPauseButton()
        
        downloadingLabel.text = stringFromTimeInterval(interval: audioPlayer.currentTime) as String
    }
    
    func downloadFileFromURL(url: URL){
        var downloadTask = URLSessionDownloadTask()
        downloadTask = URLSession.shared.downloadTask(with: url, completionHandler: {
            customURL, response, error in
            
            self.play(url: customURL!)
        })
        
        downloadTask.resume()
    }
    
    func play(url: URL) {
        
        
        downloadingLabel.text = ""
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            
            
            slider.minimumValue = 0
            slider.maximumValue = Float(audioPlayer.duration)
            
            print("YASER : Slider Max Value : \(slider.maximumValue)")
            
            musicTime.text = stringFromTimeInterval(interval: audioPlayer.duration) as String
            //            self.playIcon.isEnabled = true
            toolbar.items?[4].isEnabled = true
            toolbar.items?[8].isEnabled = true
            slider.isEnabled = true
            changeToPauseButton()
            audioPlayer.numberOfLoops = -1
            
            print("YASER: SliderTimer")
            
            sliderTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(sliderChangeWhenPlay), userInfo: nil, repeats: true)
            sliderTimer.fire()

            
        }
        catch{
            print(error)
        }
    }
    var currentTime = 1;
    func sliderChangeWhenPlay() {
        if self.audioPlayer.isPlaying {
            currentTime += 1
            self.slider.value = Float(self.currentTime)
            print("YASER: SliderTimer: \(self.currentTime)")
            
        }
    }
    
    func stringFromTimeInterval(interval: TimeInterval) -> NSString {
        
        let ti = NSInteger(interval)
        
        
        let seconds = ti % 60
        let minutes = (ti / 60) % 60
        
        return NSString(format: "%0.2d:%0.2d",minutes,seconds)
    }
    
    func changeToPlayButton()
    {
        let playPauseButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.play, target: self, action: #selector(DetailViewController.playMusic(_:)))
        toolbar.items?[4] = playPauseButton
        //playIcon = playPauseButton
        
        
    }
    
    func changeToPauseButton()
    {
        let playPauseButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.pause, target: self, action: #selector(DetailViewController.playMusic(_:)))
        
        toolbar.items?[4] = playPauseButton
        //playIcon = playPauseButton
        
    }

}
