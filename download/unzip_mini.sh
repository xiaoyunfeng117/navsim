LOG_FILE="download_log.txt"

# 处理相机数据
for split in {0..7}; do
    output="openscene_sensor_mini_camera_${split}.tgz"
    echo "Extracting file openscene_sensor_mini_camera_${split}.tgz"
    
    if [ -f "$output" ]; then
        tar -xzf "$output"
        # 只在解压完成后记录成功信息
        echo "[$(date +'%Y-%m-%d %H:%M:%S')] SUCCESS: Extracted camera split ${split}" >> "$LOG_FILE"
    else
        echo "[$(date +'%Y-%m-%d %H:%M:%S')] ERROR: Failed to download camera split ${split}" >> "$LOG_FILE"
    fi
done

# 处理激光雷达数据
for split in {0..7}; do
    output="openscene_sensor_mini_lidar_${split}.tgz"
    echo "Extracting file openscene_sensor_mini_lidar_${split}.tgz"
    
    if [ -f "$output" ]; then
        tar -xzf "$output"
        # 只在解压完成后记录成功信息
        echo "[$(date +'%Y-%m-%d %H:%M:%S')] SUCCESS: Extracted lidar split ${split}" >> "$LOG_FILE"
    else
        echo "[$(date +'%Y-%m-%d %H:%M:%S')] ERROR: Failed to download lidar split ${split}" >> "$LOG_FILE"
    fi
done