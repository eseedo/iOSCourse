//
//  ViewController.swift
//  BullsEye
//
//  Created by eseedo on 11/29/18.
//  Copyright © 2018 eseedo. All rights reserved.
//


import UIKit

//导入音频框架
import AVFoundation

class ViewController: UIViewController {
  
  //定义了一个outlet类型的slider变量
  @IBOutlet weak var slider: UISlider!
  
  //定义了一个outlet类型的label变量
  @IBOutlet weak var targetLabel: UILabel!
  
  //定义了用来显示玩家总得分的outlet 标签变量
  @IBOutlet weak var scoreLabel: UILabel!
  
  //定义了用来显示游戏回合数的outlet 标签变量
  @IBOutlet weak var roundLabel: UILabel!
  
  //定义一个音频播放器变量
  var audioPlayer: AVAudioPlayer!
  
  var currentValue = 0
  var targetValue = 0
  var score = 0
  var round = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //更改滑动条的外观
    let thumbImageNormal =  UIImage(named: "SliderThumb-Normal")!
    slider.setThumbImage(thumbImageNormal, for: .normal)
    
    let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
    slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
    
    let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    
    let trackLeftImage = UIImage(named: "SliderTrackLeft")!
    let trackLeftResizable =
      trackLeftImage.resizableImage(withCapInsets: insets)
    slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
    
    let trackRightImage = UIImage(named: "SliderTrackRight")!
    let trackRightResizable =
      trackRightImage.resizableImage(withCapInsets: insets)
    slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    
    //开启新的游戏回合
    startNewGame()
    
    //播放背景音乐
    playBgMusic()
  }
  
  @IBAction func showAlert() {
    
     //定义一个用来保存差值的变量，并使用新的算法计算差值
    let difference = abs(targetValue - currentValue)
    
    //计算玩家的当前得分
    var points = 100 - difference
    
    
    //设置标题的内容
    let title: String
    if difference == 0 {
      title = "运气逆天！赶紧去买注彩票吧!"
      points += 100
    } else if difference < 5 {
      title = "太棒了！差一点就到了！"
      if difference == 1 {
        points += 50
      }
    } else if difference < 10 {
      title = "很不错！继续努力！"
    } else {
      title = "差太远了，君在长江头，我在长江尾~"
    }
    
    //计算玩家的总得分
    score += points
    
    //设置消息体的内容
    let message = "您的得分是： \(points) 分"
    
    let alert = UIAlertController(title: title,
                                message: message,
                         preferredStyle: .alert)
    
    let action = UIAlertAction(title: "OK", style: .default,
                             handler: { _ in
                              self.startNewRound()
                             })
    
    alert.addAction(action)
    
    //显示提示信息
    present(alert, animated: true, completion: nil)
  }
  
  @IBAction func sliderMoved(_ slider: UISlider) {
    currentValue = lroundf(slider.value)
  }
  
  @IBAction func startNewGame() {
    score = 0
    round = 0
    startNewRound()
    
    //设置动态过渡效果
    let transition = CATransition()
    transition.type = CATransitionType.fade
    transition.duration = 1
    transition.timingFunction = CAMediaTimingFunction(name:
      CAMediaTimingFunctionName.easeOut)
    view.layer.add(transition, forKey: nil)
  }
  
  func startNewRound() {
    round += 1
    targetValue = Int.random(in: 1...100)
    currentValue = 50
    slider.value = Float(currentValue)
    updateLabels()
  }
  
  func updateLabels() {
    targetLabel.text = String(targetValue)
    scoreLabel.text = String(score)
    roundLabel.text = String(round)
  }
  
  
  func playBgMusic(){
    
    let musicPath = Bundle.main.path(forResource: "bgmusic", ofType: "mp3")
    let url = URL.init(fileURLWithPath: musicPath!)
    
    do{
      audioPlayer = try AVAudioPlayer(contentsOf: url)
    }catch _ {
      audioPlayer = nil
    }
    
    //设置播放选项
    audioPlayer.numberOfLoops = -1
    audioPlayer.prepareToPlay()
    audioPlayer.play()
    
  }
  
  
}

