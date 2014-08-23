#
# Copyright 2012 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

add_lunch_combo cm_p990-userdebug

echo -n "Apply cherry-pick to system/vold"
cd $DIR/system/vold/; git remote add tonyp https://github.com/tonyp/android_system_vold.git && git fetch tonyp && git cherry-pick beca52efd9901d63244b1985b539cd96c92cc7b5
echo -n "Apply cherry-pick to packages/apps/Settings"
cd $DIR/packages/apps/Settings/; git remote add Puri321 https://github.com/Puri321/android_packages_apps_Settings.git && git fetch Puri321 && git cherry-pick cfe216f64863e0768da07134525e79f987eb5031 && git cherry-pick e60877072808a1fea247c61053837d91ec4e03d1 && git cherry-pick 818a108183534f7a0b0f5828bbe999d09416013d && git cherry-pick bded42477f6da825212feeec5b462e20da1c27e0 && git cherry-pick abe0b029b8cadd4e75899b5f199fd76c4b22b474 && git cherry-pick da08604181f6b82d36841bc9076c1d3a032ee6fc
echo -n "Apply cherry-pick to system/vold"
cd $DIR/frameworks/base/; git remote add Puri321 https://github.com/Puri321/android_frameworks_base.git && git fetch Puri321 && git cherry-pick 7f45330424da317d86efebf82a8625734ff5b572 && git cherry-pick 4f5c5a244c0a29a3833b8a2bb90fa875af1c8447 && git cherry-pick bcf9f1e4aa8155177abc1e56cb213bf4d6da6466

cd $DIR/
echo ""
echo "Applying patches for P990"
echo ""

echo "Apply patch to frameworks/base"
echo -n "Apply patch 0001-framework-base-patch.patch"
(cd frameworks/base; git am ../../device/lge/p990/patches/0001-framework-base-patch.patch) > /dev/null 2>&1
if [ $? == 0 ]; then
       echo "     [DONE]"
else
       (cd frameworks/base; git am --abort)
       echo "     [FAIL]"
fi

echo -n "Apply patch 0001-free-RAM-lagfix-persist.sys.tonyp_mem_mgmt.patch"
(cd frameworks/base; git am ../../device/lge/p990/patches/0001-free-RAM-lagfix-persist.sys.tonyp_mem_mgmt.patch) > /dev/null 2>&1
if [ $? == 0 ]; then
       echo "     [DONE]"
else
       (cd frameworks/base; git am --abort)
       echo "     [FAIL]"
fi

echo -n "0001-storage-allow-swapping-primary-storage-for-apps.patch"
(cd frameworks/base; git am ../../device/lge/p990/patches/00001-storage-allow-swapping-primary-storage-for-apps.patch) > /dev/null 2>&1
if [ $? == 0 ]; then
       echo "     [DONE]"
else
       (cd frameworks/base; git am --abort)
       echo "     [FAIL]"
fi

echo -n "0002-Option-to-enforce-statusbar-transparency.patch"
(cd frameworks/base; git am ../../device/lge/p990/patches/0002-Option-to-enforce-statusbar-transparency.patch) > /dev/null 2>&1
if [ $? == 0 ]; then
       echo "     [DONE]"
else
       (cd frameworks/base; git am --abort)
       echo "     [FAIL]"
fi

echo "Apply patch to frameworks/native"
echo -n "Apply patch 0001-Fix-layer-dump-for-tegra2.patch"
(cd frameworks/native; git am ../../device/lge/p990/patches/0001-Fix-layer-dump-for-tegra2.patch) > /dev/null 2>&1
if [ $? == 0 ]; then
       echo "     [DONE]"
else
       (cd frameworks/native; git am --abort)
       echo "     [FAIL]"
fi

echo "Apply patch to frameworks/av"
echo -n "Apply patch 0001-ifdef-for-ICS-Audio-Blob-compatibility.patch"
(cd frameworks/av; git am ../../device/lge/p990/patches/0001-ifdef-for-ICS-Audio-Blob-compatibility.patch) > /dev/null 2>&1
if [ $? == 0 ]; then
	echo "     [DONE]"
else
	(cd frameworks/av; git am --abort)
	echo "     [FAIL]"
fi

echo -n "Apply patch 0002-Add-missing-functions-and-signatures-for-older-OMX-v.patch"
(cd frameworks/av; git am ../../device/lge/p990/patches/0002-Add-missing-functions-and-signatures-for-older-OMX-v.patch) > /dev/null 2>&1
if [ $? == 0 ]; then
	echo "     [DONE]"
else
	(cd frameworks/av; git am --abort)
	echo "     [FAIL]"
fi

echo "Apply patch to packages/apps/Settings"
echo -n "Apply patch 0001-add-persist.sys.tonyp_mem_mgmt-settings.patch"
(cd packages/apps/Settings; git am ../../device/lge/p990/patches/0001-add-persist.sys.tonyp_mem_mgmt-settings.patch) > /dev/null 2>&1
if [ $? == 0 ]; then
	echo "     [DONE]"
else
	(cd packages/apps/Settings; git am --abort)
	echo "     [FAIL]"
fi

echo "Apply patch to external/skia"
echo -n "Apply patch 0001-external-skia-patch.patch"
(cd external/skia; git am ../../device/lge/p990/patches/0001-external-skia-patch.patch) > /dev/null 2>&1
if [ $? == 0 ]; then
	echo "     [DONE]"
else
	(cd external/skia; git am --abort)
	echo "     [FAIL]"
fi

echo "Apply patch to bionic"
echo -n "Apply patch 0003-Add-tegra2-to-bionic.patch"
(cd bionic; git am ../device/lge/p990/patches/0003-Add-tegra2-to-bionic.patch) > /dev/null 2>&1
if [ $? == 0 ]; then
	echo "     [DONE]"
else
	(cd bionic; git am --abort)
	echo "     [FAIL]"
fi

echo "Apply patch to hardware/libhardware"
echo -n "Apply patch 0001-Star-audio-patch.patch"
(cd hardware/libhardware; git am ../../device/lge/p990/patches/0001-Star-audio-patch.patch) > /dev/null 2>&1
if [ $? == 0 ]; then
	echo "     [DONE]"
else
	(cd hardware/libhardware; git am --abort)
	echo "     [FAIL]"
fi

echo "Apply patch to vendor/pa"
echo -n "Apply patch 0001-P990-patch.patch"
(cd vendor/pa; git am ../../device/lge/p990/patches/0001-P990-patch.patch) > /dev/null 2>&1
if [ $? == 0 ]; then
	echo "     [DONE]"
else
	(cd hardware/libhardware; git am --abort)
	echo "     [FAIL]"
fi
