function set_font_size() {
    // 我设置了最大宽度限制 . 如果设备宽度超过这个宽度将使用该数值
    let maxWith  = 640;
    // 获取设备宽度
    let htmlWith = document.documentElement.clientWidth || document.body.clientWidth;
    // 获取html元素
    let htmlDom  = document.getElementsByTagName('html')[ 0 ];

    // 判断 设备宽度 是否 小于 最大宽度限制 , 如果是 则使用 设备宽度 , 如果不是则使用 最大宽度.
    let result = htmlWith < maxWith ? htmlWith : maxWith;

    // 将最终结果 分成10份加以px 赋值给htmlElement的fontsize
    htmlDom.style.fontSize = result / 10 + 'px';
}

// 监听 resize, 重新计算html Fontsize
window.addEventListener('resize', set_font_size);

// 初始设备大小
set_font_size();

