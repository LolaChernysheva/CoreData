//
//  ViewController.swift
//  MyCars
//
//  Created by Ivan Akulov on 07/11/16.
//  Copyright © 2016 Ivan Akulov. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var context: NSManagedObjectContext!
    //lazy var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var markLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var lastTimeStartedLabel: UILabel!
    @IBOutlet weak var numberOfTripsLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var myChoiceImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getDataFromFile() {
        //проверка наличия записи в CoreData. Если они есть, то их не перезаписываем
        let fetchRequest: NSFetchRequest<Car> = Car.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "mark != nil")
        
        //переменная для проверки количества записей в coredata
        var records = 0
        do {
            let count = try context.count(for: fetchRequest)
            records = count
            print("Is Data there already?")
        } catch {
            print(error.localizedDescription)
        }
        //если количество записей не равно нулю, то это означает, что мы уже записывали данные -> проверяем количество записей
        //если количество записей = 0, то продолжаем, то прекращаем метод и не загружаем данные из файла
        guard records == 0 else { return }
        //необходимо считать данные с файла. Для этого сначала ищем файл
        let pathToFile = Bundle.main.path(forResource: "data", ofType: "plist")
        //получение содержимого файла
        let dataArray = NSArray(contentsOfFile: pathToFile!)!
        //получение данных, которые хранятся в словарях
        for dictionary in dataArray {
            let entity = NSEntityDescription.entity(forEntityName: "Car", in: context)
            //созданеи объекта, в котрый будут помещаться данные из конкретного словаря
            let car = NSManagedObject(entity: entity!, insertInto: context) as! Car
            //присвоить созданному объекту значения, хранящиеся в словаре
            let carDictionary = dictionary as! NSDictionary
            car.mark = carDictionary["mark"] as? String
            car.model = carDictionary["model"] as? String
            car.rating = carDictionary["rating"] as? NSNumber
            car.lastStarted = carDictionary["lastStarted"] as? Date
            car.timeDriven = carDictionary["imeDriven "] as? NSNumber
            car.myChoice = carDictionary["myChoice"] as? NSNumber
            
            let imageName = carDictionary["imageName"] as! String
            let image = UIImage(named: imageName)
            let imageData = UIImage.pngData(image!)
            car.imageData = imageData as! Data
            
            let colorDictionary = carDictionary["tintColor"] as? NSDictionary
            car.tintColor = getColor(colorDictionary: colorDictionary!)
        }
    }
    
    func getColor(colorDictionary: NSDictionary) -> UIColor {
        let red = colorDictionary["red"] as! NSNumber
        let green = colorDictionary["green"] as! NSNumber
        let blue = colorDictionary["blue"] as! NSNumber
        
        return UIColor(red: CGFloat(red.floatValue)/255, green: CGFloat(green.floatValue)/255, blue: CGFloat(blue.floatValue)/255, alpha: 1.0)
        
    }
    
    
    
    @IBAction func segmentedCtrlPressed(_ sender: UISegmentedControl) {
        
    }
    
    @IBAction func startEnginePressed(_ sender: UIButton) {
        
    }
    
    @IBAction func rateItPressed(_ sender: UIButton) {
        
    }
}

