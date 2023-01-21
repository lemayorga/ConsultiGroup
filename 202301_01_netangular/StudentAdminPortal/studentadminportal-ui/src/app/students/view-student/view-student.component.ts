import { Component, OnInit } from '@angular/core';
import { MatSnackBar } from '@angular/material/snack-bar';
import { ActivatedRoute } from '@angular/router';
import { Address } from 'src/app/models/api-models/address.model';
import { Gender } from 'src/app/models/api-models/gender.model';
import { Student } from 'src/app/models/api-models/student.model';
import { GenderService } from 'src/app/services/gender.service';
import { StudentService } from '../student.service';

@Component({
  selector: 'app-view-student',
  templateUrl: './view-student.component.html',
  styleUrls: ['./view-student.component.css']
})
export class ViewStudentComponent implements OnInit{

  studentId : string | null | undefined;
  genderList: Gender[]  = [];

  student: Student = {
    id: '',
    firstName: '',
    lastName: '',
    dateOfBirth: '',
    email: '',
    mobile: 0,
    profileImageUrl: '',
    genderId: '',
    gender: {
      id: '',
      description: ''
    },
    address: {
      id: '',
      physicalAddress: '',
      postalAddress: ''
    }
  };


  constructor(private  studentService: StudentService,
           private route: ActivatedRoute,
           private genderervice: GenderService,
           private snackbar: MatSnackBar){ }


  ngOnInit(): void {
    this.route.paramMap.subscribe(
      (param) => {
        this.studentId = param.get('id');

        if(this.studentId){
          this.studentService.getStudent(this.studentId)
          .subscribe(
            (response) =>{
                console.log(response)
                this.student = response;
            });

            this.genderervice.getGenders()
            .subscribe(
              (response) =>{
                  console.log(response)
                  this.genderList = response;
              });
        }
      });
  }

  onUpdate(){
    this.studentService.updateStudent(this.student.id, this.student)
    .subscribe(
      (successResponse) => {
        // Show a notification
        this.snackbar.open('Student updated successfully', undefined, {
          duration: 2000
        });
      },
      (errorResponse) => {
        // Log it
        console.log(errorResponse);
      }
    );
  }
}
