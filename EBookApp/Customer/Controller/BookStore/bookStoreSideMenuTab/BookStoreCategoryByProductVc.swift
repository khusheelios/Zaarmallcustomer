
import UIKit
import Alamofire

class BookStoreCategoryByProductVc: UIViewController ,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var categoryNamelbl: UILabel!
    var  CategoryItemsArray = ["Clothing","Shoe","Accessory"]
    
    var getSubCategoryId = String()
    var strCategoryId = String()

    var SubCategoryname = String()

     var SubCategoryimage = String()

     var SubCategoryis_active = String()

     var SubCategoryis_delete = String()

     var SubCategorycreate_date = String()
    var SubCategoryNameArray = [String]()
    var SubCategoryImageArray = [String]()
    var SubCategoryIdArray = [String]()
    var SelectedSubCategoryId = String()
    var SelectedSubCategoryName = String()
    
   var  getSelectedStrCatrgoryId = String()
    var getSelectedStrCatrgoryName = String()


    override func viewDidLoad() {
        super.viewDidLoad()
        getSubCategory()
        categoryNamelbl.text = getSelectedStrCatrgoryName

        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        }
        

    @IBAction func btnBack(_ sender: Any) {
                   self.dismiss(animated: true, completion: nil)

//        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//
//        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookMoreCategoryVc") as! EBookMoreCategoryVc
//        self.present(nextViewController, animated:true, completion:nil)

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SubCategoryNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "BookStoreCategoryProductTVC", for: indexPath) as!BookStoreCategoryProductTVC
        cell.moreCategorylbl?.text = SubCategoryNameArray[indexPath.row]
        
        //tableView.reloadData()

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.SelectedSubCategoryId = self.SubCategoryIdArray[indexPath.row]
            self.SelectedSubCategoryName = self.SubCategoryNameArray[indexPath.row]
                        let storyBoard : UIStoryboard = UIStoryboard(name: "bookStore", bundle:nil)
        
                        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "BookStoreMoreCategoryProductVc") as! BookStoreMoreCategoryProductVc
            nextViewController.getSelectedStrCatrgoryId = self.SelectedSubCategoryId
            nextViewController.getSelectedStrCatrgoryName = self.SelectedSubCategoryName

        
                        nextViewController.modalPresentationStyle = .overCurrentContext
                         nextViewController.modalTransitionStyle = .crossDissolve
                         nextViewController.view.backgroundColor = UIColor.black.withAlphaComponent(0.15)
        
                        self.present(nextViewController, animated:true, completion:nil)

        }



    }
    
    func getSubCategory(){
        
                let parametersBal: Parameters=[
                    "category_id":self.getSelectedStrCatrgoryId
                   ]
                
                print(parametersBal)
                
                
                
                Alamofire.request("http://zaarmall.com/development/get_all_sub_categories", method: .post, parameters: parametersBal).responseJSON
                    {
                                        response in
                                        
                                        print(response)
                                        
                                        //getting the json value from the server
                                        if let result = response.result.value {
                                            
                                            
                                            var status = (result as AnyObject).value(forKey: "status") as! CFBoolean

                                          //   var message = (result as AnyObject).value(forKey: "message") as! NSDictionary
                                            var data = (result as AnyObject).value(forKey: "data") as! NSArray
                                            


                                            
                                            if (status == 200 as CFBoolean )
                                            {

                                                print("hiiii")
                                                  for user in data
                                                  {
                                                    
                                                    self.getSubCategoryId = (user as AnyObject).value(forKey: "sub_category_id") as! String
                                                    self.SubCategoryIdArray.append(self.getSubCategoryId)
                                                    
                                                    UserDefaults.standard.set(self.getSubCategoryId, forKey: "sub_category_id")
                                                    UserDefaults.standard.synchronize()
                                                    
                                                    self.strCategoryId = (user as AnyObject).value(forKey: "category_id") as! String
                                                    
                                                    UserDefaults.standard.set(self.strCategoryId, forKey: "category_id")
                                                    UserDefaults.standard.synchronize()


                                                    

                                                    self.SubCategoryname = (user as AnyObject).value(forKey: "name") as! String
                                                    print(self.SubCategoryname)
                                                    self.SubCategoryNameArray.append(self.SubCategoryname)
                                                    

                                                    
                                                    UserDefaults.standard.set(self.SubCategoryname, forKey: "name")
                                                    UserDefaults.standard.synchronize()

                                                     if let subCategoryImage = (user as AnyObject).value(forKey: "image") as? String{
                                                                                                            self.SubCategoryimage  = subCategoryImage
                                                                                                            print(self.SubCategoryimage)
                                                                                                            self.SubCategoryImageArray.append(self.SubCategoryimage)
                                                        
                                                                                                            UserDefaults.standard.set(self.SubCategoryimage, forKey: "image")
                                                                                                            UserDefaults.standard.synchronize()


                                                        
                                                        
                                                     }
                                                     else {
                                                         print("JSON is returning nil")
                                                                                                            self.SubCategoryImageArray.append("Null")
                                                        

                                                     }

                                                    
                                                    

                                                    self.SubCategoryis_active = (user as AnyObject).value(forKey: "is_active") as! String
                                                    print(self.SubCategoryis_active)
                                                    
                                                    UserDefaults.standard.set(self.SubCategoryis_active, forKey: "is_active")
                                                    UserDefaults.standard.synchronize()


                                                    self.SubCategoryis_delete = (user as AnyObject).value(forKey: "is_delete") as! String
                                                    
                                                    UserDefaults.standard.set(self.SubCategoryis_delete, forKey: "is_delete")
                                                    UserDefaults.standard.synchronize()


                                                    self.SubCategorycreate_date = (user as AnyObject).value(forKey: "create_date") as! String
                                                    
                                                    UserDefaults.standard.set(self.SubCategorycreate_date, forKey: "create_date")
                                                    UserDefaults.standard.synchronize()







                                                    
                                                  }
                                                
                                               DispatchQueue.main.async {
                                                   self.tableView.reloadData()
                                               }

                                                


                                            }
                                            else{
                                                
                                            }

                                        }


                }
                

        
    }
    



}

