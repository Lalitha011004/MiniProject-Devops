#!/bin/bash
    echo Hello
    sh 'chmod +x build.sh'
    sh './build.sh'
    docker login -u lalithambigai -p Lali_0121
    docker tag test lalithambigai011004/miniproject-devops
    docker push lalithambigai011004/miniproject-devops
