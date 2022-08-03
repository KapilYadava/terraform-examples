resource "local_file" "my-test-file" {
    filename = var.test-filename
    content = "This is a test file used to test local file provider. This file is created at ${time_static.my-time-stamp.id}"
    
    lifecycle {
      //create_before_destroy = true
      //prevent_destroy = true
      //ignore_changes = all
      ignore_changes = [
        
      ]
      
    }
}

resource "local_file" "my-pet-name" {
   filename= var.my-pet-filename
   content = "My pet is Mrs. dog"

   depends_on = [
     random_pet.my-pet
   ]
}

resource "random_pet" "my-pet" {
   length = var.length
   separator = var.separator
   prefix = var.prefix
}

resource "time_static" "my-time-stamp" {

}

output "my-local-time" {
   value = time_static.my-time-stamp.id
   description = "This is my system time."
}

output "my-pet" {
   value = random_pet.my-pet.id
   description = "This is my pet."
}