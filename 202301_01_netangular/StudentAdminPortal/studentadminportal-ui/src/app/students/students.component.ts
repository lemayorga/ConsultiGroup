import { Component, OnInit, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { Student } from '../models/api-models/student.model';
import { StudentService } from './student.service';

@Component({
  selector: 'app-students',
  templateUrl: './students.component.html',
  styleUrls: ['./students.component.css']
})
export class StudentsComponent implements OnInit{

  students: Student[] = [];
  displayColumns: string[] = [
    'firstName' , 'lastName' , 'dateOfBirth', 'email','mobile', 'gender'
  ];

  dataSource: MatTableDataSource<Student> = new MatTableDataSource<Student>();
  @ViewChild(MatPaginator) matPaginator! : MatPaginator;
  @ViewChild(MatSort) matSort! : MatSort;
 filterTable: string = '';

  constructor(public  studentService: StudentService){ }
  
  ngOnInit(): void {
    this.studentService.getStudent()
    .subscribe(
     (response) =>{
      this.students = response;
      this.dataSource = new MatTableDataSource<Student>(this.students);
      if(this.matPaginator){
        this.dataSource.paginator = this.matPaginator;
      }  
      if(this.matSort){
        this.dataSource.sort = this.matSort;
      }
        console.log(response)
     },
     (error) =>{
      console.log(error)
     }
    )  
  }
  filterStudents(){
    this.dataSource.filter = this.filterTable.trim().toLowerCase();
  }
}
