# 엘라스틱서치 8.4.2 자동 설치 및 설정 setup 앤서블

## 필수 준비

- **필수 셋팅**: `system_download.txt 파일 /data/work 하위에 위치 필수!!!!`

## 참조 파일

- **셋업 참조 파일**: `system_download.txt(/data/work 하위에 위치 필수!!!!)`
- **전체 파이프라인 플레이북**: `elasticsearch_deploy.yml`

## 각 파일 설명

1. **`hosts.ini`** : 인벤토리(관리 대상 시스템 리스트)
2. **`main.yml`** : play_book 변수를 담은 파일
3. **`tar_scp.sh`** : 엘라스틱서치 각 서버에 tar파일 생성
4. **`entrypoint.sh`** : 엘라스틱서치 초기 설정 파일 동적 setup 및 각 엘라스틱서치 서버 배포하는 스크립트
5. **`elasticsearch_deploy.yml`** : 앤서블 플레이북

## 실행 방법

1. `elasticsearch_deploy.yml` 플레이북을 실행하여 전체 파이프라인을 시작합니다.
   ```sh
   ansible-playbook -i /data/work/elasticsearch_8.4.2_ansible/hosts.ini /data/work/elasticsearch_8.4.2_ansible/elasticsearch_deploy.yml
   ```

## ansible 플레이북 구조

- `Create es_tar directory`: 각 엘라스틱서치 서버에 기본 엘라스틱서치 디렉토리, tar 저장할 디렉토리 생성
- `Copy es_tar to servers`: tar_scp.sh 스크립트를 실행하여 엘라스틱서치 tar 파일 각 서버 tar 저장 디렉토리에 복사
- `Extract es_tar`: 각 서버 엘라스틱서치 tar파일 압축 해제
- `sb_link`: 접근 편의를 위해 심볼링 링크 설정
- `entrypoint_sh start`: entrypoint.sh 스크립트를 실행하여 각 서버 엘라스틱서치 설정 동적 setup 및 setup된 설정 파일 각 엘라스틱서치 서버 배포

---

이 플레이북은 엘라스틱서치 클러스터를 자동으로 설정하고 Start 하는 과정을 자동화 합니다.
