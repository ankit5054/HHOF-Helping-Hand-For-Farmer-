from firebase import firebase
from selenium import webdriver



conn= firebase.FirebaseApplication("https://sih-hhof.firebaseio.com/",None)
result=conn.get("","")
val=list(result.values())
keys=list(result.keys())
for i in range(len(val)):
	# print("BODY",i["body"])
	# print("SENDER",i["sender"])
	try:
		temp=val[i]["body"].split()
		if temp[0]=='Portal' or temp[0]=="portal":
			farmerid=temp[1]
			pswd=temp[2]
			op=temp[3]
			pn=temp[4]
			pt=temp[5]
			if op=="ADD" or op=="add" or op=="Add":
				price=temp[6]
				quant=temp[7]
				quality=temp[8]
				string=op+","+val[i]["sender"]+','+farmerid+','+pswd+','+pn+','+pt+','+price+','+quant+','+quality
				driver=webdriver.PhantomJS("C:\\Users\\ANKIT MISHRA\\Desktop\\phantomjs-2.1.1-windows\\bin\\phantomjs.exe")
				driver.get("https://aedc49a4.ngrok.io/SIHproject/updateviamessage.jsp")
				driver.find_element_by_id("receive").send_keys(string)
				driver.find_element_by_id("submit").click()	
				driver.close()
				# with open("add.txt","a") as out_file:
				# 	out_file.write(string)
			elif op=="Delete" or op=="DELETE" or op=="delete":
				string=op+","+val[i]["sender"]+','+farmerid+','+pswd+','+pn+','+pt
				driver=webdriver.PhantomJS("C:\\Users\\ANKIT MISHRA\\Desktop\\phantomjs-2.1.1-windows\\bin\\phantomjs.exe")
				driver.get("https://aedc49a4.ngrok.io/SIHproject/updateviamessage.jsp")
				driver.find_element_by_id("receive").send_keys(string)
				driver.find_element_by_id("submit").click()	
				driver.close()
				# with open("del.txt","a") as out_file:
				# 	out_file.write(string)	
			else:
				print("WRONG SYNTAX")
			
		if keys[i]!='-M013I_5CMK9MZ-KJ0Dx':
			print("deleted",keys[i])
			conn.delete("",keys[i])
	except:
		string=val[i]["sender"]+','+"INVALID"
		driver=webdriver.PhantomJS("C:\\Users\\ANKIT MISHRA\\Desktop\\phantomjs-2.1.1-windows\\bin\\phantomjs.exe")
		driver.get("https://aedc49a4.ngrok.io/SIHproject/updateviamessage.jsp")
		driver.find_element_by_id("receive").send_keys(string)
		driver.find_element_by_id("submit").click()	
		driver.close()
		