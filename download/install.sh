# 1. Clone the navsim-devkit
git clone https://github.com/autonomousvision/navsim.git
cd navsim
# 2. Download the dataset
cd download
# set proxy if needed
export http_proxy=http://10.10.64.15:18000
export https_proxy=http://10.10.64.15:18000
# download maps  必须
wget https://motional-nuplan.s3-ap-northeast-1.amazonaws.com/public/nuplan-v1.1/nuplan-maps-v1.1.zip
unzip nuplan-maps-v1.1.zip
rm nuplan-maps-v1.1.zip
mv nuplan-maps-v1.0 maps

# download mini dataset 可选
wget https://huggingface.co/datasets/OpenDriveLab/OpenScene/resolve/main/openscene-v1.1/openscene_metadata_mini.tgz
tar -xzf openscene_metadata_mini.tgz
rm openscene_metadata_mini.tgz
mv openscene-v1.1/meta_datas mini_navsim_logs
rm -r openscene-v1.1

for split in {0..15}; do
    wget https://huggingface.co/datasets/OpenDriveLab/OpenScene/resolve/main/openscene-v1.1/openscene_sensor_mini_camera/openscene_sensor_mini_camera_${split}.tgz
    echo "Extracting file openscene_sensor_mini_camera_${split}.tgz"
    tar -xzf openscene_sensor_mini_camera_${split}.tgz
    rm openscene_sensor_mini_camera_${split}.tgz
done

for split in {0..15}; do
    wget https://huggingface.co/datasets/OpenDriveLab/OpenScene/resolve/main/openscene-v1.1/openscene_sensor_mini_lidar/openscene_sensor_mini_lidar_${split}.tgz
    echo "Extracting file openscene_sensor_mini_lidar_${split}.tgz"
    tar -xzf openscene_sensor_mini_lidar_${split}.tgz
    rm openscene_sensor_mini_lidar_${split}.tgz
done

mv openscene-v1.1/sensor_blobs mini_sensor_blobs
rm -r openscene-v1.1

# download trainval dataset 可选
wget https://huggingface.co/datasets/OpenDriveLab/OpenScene/resolve/main/openscene-v1.1/openscene_metadata_trainval.tgz
tar -xzf openscene_metadata_trainval.tgz
rm openscene_metadata_trainval.tgz

for split in {0..199}; do
    wget https://huggingface.co/datasets/OpenDriveLab/OpenScene/resolve/main/openscene-v1.1/openscene_sensor_trainval_camera/openscene_sensor_trainval_camera_${split}.tgz
    echo "Extracting file openscene_sensor_trainval_camera_${split}.tgz"
    tar -xzf openscene_sensor_trainval_camera_${split}.tgz
    rm openscene_sensor_trainval_camera_${split}.tgz
done

for split in {0..199}; do
    wget https://huggingface.co/datasets/OpenDriveLab/OpenScene/resolve/main/openscene-v1.1/openscene_sensor_trainval_lidar/openscene_sensor_trainval_lidar_${split}.tgz
    echo "Extracting file openscene_sensor_trainval_lidar_${split}.tgz"
    tar -xzf openscene_sensor_trainval_lidar_${split}.tgz
    rm openscene_sensor_trainval_lidar_${split}.tgz
done

mv openscene-v1.1/meta_datas trainval_navsim_logs
mv openscene-v1.1/sensor_blobs trainval_sensor_blobs
rm -r openscene-v1.1

# download test dataset 可选
wget https://huggingface.co/datasets/OpenDriveLab/OpenScene/resolve/main/openscene-v1.1/openscene_metadata_test.tgz
tar -xzf openscene_metadata_test.tgz
rm openscene_metadata_test.tgz

for split in {0..31}; do
    wget https://huggingface.co/datasets/OpenDriveLab/OpenScene/resolve/main/openscene-v1.1/openscene_sensor_test_camera/openscene_sensor_test_camera_${split}.tgz
    echo "Extracting file openscene_sensor_test_camera_${split}.tgz"
    tar -xzf openscene_sensor_test_camera_${split}.tgz
    rm openscene_sensor_test_camera_${split}.tgz
done

for split in {0..31}; do
    wget https://huggingface.co/datasets/OpenDriveLab/OpenScene/resolve/main/openscene-v1.1/openscene_sensor_test_lidar/openscene_sensor_test_lidar_${split}.tgz
    echo "Extracting file openscene_sensor_test_lidar_${split}.tgz"
    tar -xzf openscene_sensor_test_lidar_${split}.tgz
    rm openscene_sensor_test_lidar_${split}.tgz
done

mv openscene-v1.1/meta_datas test_navsim_logs
mv openscene-v1.1/sensor_blobs test_sensor_blobs
rm -r openscene-v1.1

# 3. Set environment variables
export NUPLAN_MAP_VERSION="nuplan-maps-v1.0"
export NUPLAN_MAPS_ROOT="$HOME/navsim_workspace/dataset/maps"
export NAVSIM_EXP_ROOT="$HOME/navsim_workspace/exp"
export NAVSIM_DEVKIT_ROOT="$HOME/navsim_workspace/navsim"
export OPENSCENE_DATA_ROOT="$HOME/navsim_workspace/dataset"

