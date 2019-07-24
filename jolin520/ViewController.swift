import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pictureView: UIImageView!
    
    @IBOutlet weak var datepicker: UIDatePicker!
    @IBOutlet weak var timePointSlider: UISlider!
    
    
    
    let dateFormatter = DateFormatter()
    var dateString:String = ""
    var timer:Timer?
    var imgnum = 0
    var slidernum = 0
    let img = ["19990910","20000426","20001222","20010707","20030307","20040227","20050425","20060512","20070921","20090327","20100813","20120914","20141115","20181226"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        time()
        datepicker.locale=Locale(identifier: "zh_TW")
        dateFormatter.dateFormat = "yyyy/MM/dd"
    }
//比對陣列內的照片,num預設0
    func compare(){
//如果到最後一張照片時則從第一張開始,不是的話繼續跑照片num+=1
        if imgnum>=img.count{
            imgnum=0
            choosePicture(num2: imgnum)
            pictureView.image=UIImage(named: img[imgnum])
        }else{
            choosePicture(num2: imgnum)
            pictureView.image=UIImage(named: img[imgnum])
        }
//連動Slider
        timePointSlider.value = Float(imgnum)
        imgnum+=1
        
    }
    
    func time(){
        timer=Timer.scheduledTimer(withTimeInterval: 1, repeats: true){(timer) in self.compare()}
    }
    
    @IBAction func changeValueSlider(_ sender: UISlider) {
        sender.value.round()
        slidernum=Int(sender.value)
        pictureView.image=UIImage(named: img[slidernum])
        print(slidernum)
        choosePicture(num2: slidernum)
    }
    
    
    @IBAction func autoPlaySwitch(_ sender: UISwitch) {
        if sender.isOn {
            time()
            imgnum = slidernum
            timePointSlider.value = Float(imgnum)
        }else{
            timer?.invalidate()
        }
    }
//用switch-case選照片
    func choosePicture(num2:Int) {
        switch num2 {
        case 0:
            dateString = "1999/09/10"
        case 1:
            dateString = "2000/04/26"
        case 2:
            dateString = "2000/12/22"
        case 3:
            dateString = "2001/07/07"
        case 4:
            dateString = "2003/03/07"
        case 5:
            dateString = "2004/02/27"
        case 6:
            dateString = "2005/04/25"
        case 7:
            dateString = "2006/05/12"
        case 8:
            dateString = "2007/09/21"
        case 9:
            dateString = "2009/03/27"
        case 10:
            dateString = "2010/08/13"
        case 11:
            dateString = "2012/09/14"
        case 12:
            dateString = "2014/11/15"
        default:
            dateString = "2018/12/26"
        }
        let date = dateFormatter.date(from: dateString)
        datepicker.date=date!
    }
    override func viewDidDisappear(_ animated: Bool) {
        timer?.invalidate()
    }
}

