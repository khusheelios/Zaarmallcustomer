//
//  EBookSettingViewController.swift
//  EBookApp
//
//  Created by apple on 04/07/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class EBookSettingViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    //BookSettingTVC
        @IBOutlet weak var OFFView: CustomizableView!
        @IBOutlet weak var ONView: CustomizableView!
    
       @IBOutlet weak var lanuagePOPUpView: CustomizableView!
       @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var lanuangefirstlbl: UILabel!
    var strLanuageName = String()


    var lanuagneArray = ["English","Arabic"]
       var selectedRows:[IndexPath] = []


        override func viewDidLoad() {
            super.viewDidLoad()

                tableView.separatorStyle = UITableViewCell.SeparatorStyle.none

                
                tableView.delegate = self
                tableView.dataSource = self

                
                    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(BookStoreSettingVc.handleTap(_:)))
                    lanuagePOPUpView.addGestureRecognizer(tapGesture)
                }
                
                @objc func handleTap(_ sender: UITapGestureRecognizer) {
                    lanuagePOPUpView.isHidden = true
                }

            @IBAction func btnDropDown(_ sender: Any) {
                if(lanuagePOPUpView.isHidden == true){
                    lanuagePOPUpView.isHidden = false

                }
                else{
                    lanuagePOPUpView.isHidden = true
                }
                
            }

        
            @IBAction func btnOff(_ sender: Any) {
                if(ONView.isHidden == true){
                    ONView.isHidden = false


                }
                else{
                    ONView.isHidden = true

                }
                
                
            }
            @IBAction func btnON(_ sender: Any) {
                ONView.isHidden = true

                


            }
        
        @IBAction func btnBack(_ sender: Any) {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)

            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EBookTabbarVc") as! EBookTabbarVc
            self.present(nextViewController, animated:true, completion:nil)

            
        }
    
                func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                    return lanuagneArray.count
                }
                
                func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "BookSettingTVC", for: indexPath) as!BookSettingTVC
                    
                        


                    
                    cell.languagelbl.text = lanuagneArray[indexPath.row]
                    strLanuageName = cell.languagelbl.text!
                    
                    
                    if selectedRows.contains(indexPath)
                    {
                                  cell.btnLaguageSlect.setBackgroundImage(UIImage(named: "dot-7"), for: UIControl.State.normal)
                        lanuangefirstlbl.text = strLanuageName
                        lanuagePOPUpView.isHidden = true

                            //cell.btnLaguageSlect.setTitle(strLanuageName, for: .normal)
    //                    strCusinesName1 = cell.btncheck.setTitle(strCusinesName, for: .normal)

                    }
                    else
                    {
                                  cell.btnLaguageSlect.setBackgroundImage(UIImage(named: "circle-2"), for: UIControl.State.normal)
                    }
                    cell.btnLaguageSlect.tag = indexPath.row
    //                strTag = cell.btncheck.tag
    //                print(strTag)
                    cell.btnLaguageSlect.addTarget(self, action: #selector(checkBoxSelection(_:)), for: .touchUpInside)

                    
                    
                    
                    
                    

                    
                    
                    
                    

             return cell
        
        }
        
        
        @objc func checkBoxSelection(_ sender:UIButton)
        {
          let selectedIndexPath = IndexPath(row: sender.tag, section: 0)
          if self.selectedRows.contains(selectedIndexPath)
          {
            self.selectedRows.remove(at: self.selectedRows.index(of: selectedIndexPath)!)
          }
          else
          {
            self.selectedRows.append(selectedIndexPath)
          }
          self.tableView.reloadData()
        }






    }
