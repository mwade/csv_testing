#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_AGE		100
#define MAX_LINE_LEN	256

int main(int argc, char *argv[]) {
  FILE *csv;
  char line[MAX_LINE_LEN];
  int age_count[MAX_AGE + 1] = { 0 };

  if (argc < 2) {
    printf("usage: csv_parse <input filename>\n");
    exit(-1);
  }

  csv = fopen(argv[1], "r");
  if (!csv) {
    perror("fatal");
    exit(-1);
  }
  
  while(fgets(line, sizeof(line), csv)) {
    int user_id;
    int age;
    char *value;
    int line_num = 1;

    value = strtok(line, ",");

    if (value == NULL) {
      printf("warning: invalid line #%d\n", line_num);
      continue;
    } else {
      user_id = atoi(value);
    }
    
    value = strtok(NULL, "\n");

    if (value == NULL) {
      printf("warning: invalid line #%d\n", line_num);
      continue;
    } else {
      age = atoi(value);
    }

    if (age <= MAX_AGE) {
      age_count[age]++;
    }

    line_num++;
  }

  fclose(csv);

  for (int i=0; i<=MAX_AGE; i++) {
    if (age_count[i] > 0) {
      printf("%d,%d\n", i, age_count[i]);
    }
  }
}
