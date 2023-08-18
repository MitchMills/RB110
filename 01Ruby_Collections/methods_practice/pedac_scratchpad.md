- "Modify the hash such that each member of the Munster family has an additional "age_group" key that has one of three values describing the age group the family member is in (kid, adult, or senior)."
- "Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+."

# Problem
- INPUT: nested hash
- OUTPUT: nested hash
- ASSUMPTIONS:
-   Return a new hash; don't mutate the original hash

# Examples
**Original Hash**
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
**Expected Result**
munsters = { 
  "Herman" =>   { "age" => 32,  "gender" => "male",   "age_group" => "adult" },
  "Lily" =>     { "age" => 30,  "gender" => "female", "age_group" => "adult" },
  "Grandpa" =>  { "age" => 402, "gender" => "male",   "age_group" => "senior" },
  "Eddie" =>    { "age" => 10,  "gender" => "male",   "age_group" => "kid" },
  "Marilyn" =>  { "age" => 23,  "gender" => "female", "age_group" => "adult" } 
  }

**Data Structures**
- nested hashes

**Algorithm**
- 1.  Iterate over each sub-hash in the 'munsters' hash
- 2.  Assign a new key-value pair to each
-       a. the key is "age_group"
        b. the value is based on age
          i.    0 - 17: kid
          ii.   18 - 64: adult
          iii.  65+: senior
- 3.  Return the new hash