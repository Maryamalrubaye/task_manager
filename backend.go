package main

import (
	"encoding/json"
	"fmt"
	"log"
	"math/rand"
	"net/http"
	"strconv"
	"time"
	"github.com/gorilla/mux"
)

type Tasks struct {
	ID string `json: "ID"`
	TaskTitle string `json: "TaskTitle"`
	TaskContent string `json: "TaskContent"`
	Date string `json: "Date"`
}

var tasks []Tasks
func tasklist(){
	task:= Tasks{
		ID: "1",
		TaskTitle: "Go to Aydin uni",
		TaskContent: "enjoy studig in the library",
		Date: "2023-01-11",

	}
	tasks = append(tasks,task)
	task1 := Tasks{
		ID: "2",
		TaskTitle: "managment exam",
		TaskContent: "on the 16 of this month managment exam 13 chapter",
		Date: "2023-01-12",

	}
	tasks = append(tasks,task1)
	fmt.Println("task is :", tasks)
}
func homePage(w http.ResponseWriter, r *http.Request){
	fmt.Println("I am working")
}
func getTasks(w http.ResponseWriter, r *http.Request){
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(tasks)
}
func getTask(w http.ResponseWriter, r *http.Request){
		w.Header().Set("Content-Type", "application/json")
	taskId := mux.Vars(r)
	flag := false
	for i:=0; i<len(tasks); i++ {
		if taskId["ID"] == tasks[i].ID{
		  json.NewEncoder(w).Encode(tasks[i])
			flag= true
			break
		}

	}
	if flag==false{
		json.NewEncoder(w).Encode(map[string]string{"status":"error"})
	}
}
func createTask(w http.ResponseWriter, r *http.Request){
	w.Header().Set("Content-Type", "application/json")
	var task Tasks
	_ = json.NewDecoder(r.Body).Decode(&task)
	task.ID = strconv.Itoa(rand.Intn(1000))
	tasks = append(tasks, task)
	time := time.Now().Format("01-02-2006")
	task.Date = time
	json.NewEncoder(w).Encode(task)

}
func deleteTask(w http.ResponseWriter, r *http.Request){
	w.Header().Set("Content-Type", "application/")
	taskId := mux.Vars(r)
	flag := false
	for index, item := range tasks{
		if taskId["ID"] == item.ID{
			tasks = append(tasks[:index], tasks[index+1:]...)
			flag = true
			json.NewEncoder(w).Encode(map[string]string{"status":"success"})
			return
		}

	}
	if flag==false{
		json.NewEncoder(w).Encode(map[string]string{"status":"error"})
	}
}
func updateTask(w http.ResponseWriter, r *http.Request){
	w.Header().Set("Content-Type", "application/")
	taskId := mux.Vars(r)
	flag := false
	for index, item := range tasks{
		if taskId["ID"] == item.ID{
			tasks = append(tasks[:index], tasks[index+1:]...)
			var task Tasks
	_ = json.NewDecoder(r.Body).Decode(&task)
	task.ID = taskId["ID"]
	
	time := time.Now().Format("01-02-2006")
	task.Date = time
	tasks = append(tasks, task)
	flag = true
	json.NewEncoder(w).Encode(tasks)
			return
		}

	}
	if flag==false{
		json.NewEncoder(w).Encode(map[string]string{"status":"error"})
	}
}



func handleRouts(){
	router := mux.NewRouter()
	router.HandleFunc("/", homePage).Methods("GET")
	router.HandleFunc("/gettasks", getTasks).Methods("GET")
	router.HandleFunc("/gettask/{ID}", getTask).Methods("GET")
	router.HandleFunc("/create", createTask).Methods("POST")
	router.HandleFunc("/delete/{ID}", deleteTask).Methods("DELETE")
	router.HandleFunc("/update/{ID}", updateTask).Methods("PUT")
	log.Fatal(http.ListenAndServe(":8082", router))
}
func main() {
	tasklist()
	handleRouts()
}
