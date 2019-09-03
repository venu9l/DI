host = "localhost"
user = "root"
passwd = ""
database = "rdb"

link_table = "link_table"

site_speed_table = "site_speed_all_data"

site_speed_table_fileds = """CREATE TABLE IF NOT EXISTS  %s (
    link_unique_id varchar(50) NOT NULL,
    overall_score varchar(50),
    performance_score varchar(50),
    accessibility_score varchar(50),
    best_practice_score varchar(50),
    fast_render_advice varchar(50),
    avoid_scaling_images_advice varchar(50),
    compress_assets_advice varchar(50),
    optimal_css_size_advice varchar(50),
    total_size__transfer varchar(50),
    image_size__transfer varchar(50),
    javascript_size__transfer varchar(50),
    css_size__transfer varchar(50),
    total_requests varchar(50),
    image_requests varchar(50),
    css_requests varchar(50),
    javascript_requests varchar(50),
    font_requests varchar(50),
    _200_responses varchar(50),
    domains_per_page varchar(50),
    cache_time varchar(50),
    time_since_last_modification varchar(50),
    party_requests_1st varchar(50),
    party_size_1st varchar(50),
    rum_speed_index varchar(50),
    first_paint varchar(50),
    backend_time varchar(50),
    frontend_time varchar(50),
    page_load_time varchar(50),
    first_visual_change varchar(50),
    speed_index varchar(50),
    perceptual_speed_index varchar(50),
    visual_complete_85 varchar(50),
    visual_complete_95 varchar(50),
    visual_complete_99 varchar(50),
    last_visual_change varchar(50),
    timestamp varchar(50) NOT NULL,
    PRIMARY KEY (link_unique_id)
);""" % site_speed_table