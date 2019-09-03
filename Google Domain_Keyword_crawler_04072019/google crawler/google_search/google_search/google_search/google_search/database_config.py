host = "10.0.75.1"
usernm = "root"
passwd = ""
database = "google_search_sample2"

create_master_table = """CREATE TABLE IF NOT EXISTS Master_Table (SearchtermNumber varchar(30) NOT NULL,
                                                                  Search_term varchar(255) NOT NULL,
                                                                  PRIMARY KEY (SearchtermNumber),
                                                                  UNIQUE KEY (Search_term));"""

create_mainlink_table = """CREATE TABLE IF NOT EXISTS Mainlinks_Table (SearchtermNumber varchar(30) NOT NULL,
                                                                       MainlinkNumber varchar(30) NOT NULL,
                                                                       Search_term varchar(255) NOT NULL,
                                                                       Result_Type varchar(255) NOT NULL,
                                                                       URL VARCHAR(255) NOT NULL,
                                                                       Title text NOT NULL,
                                                                       Links text NOT NULL,
                                                                       Description text NOT NULL,
                                                                       Tags text default NULL,
                                                                       Position varchar(250) NOT NULL,
                                                                       Page_Special_Data varchar(255) NOT NULL,
                                                                       PRIMARY KEY (MainlinkNumber),
                                                                       UNIQUE KEY (MainlinkNumber));"""

create_reviewlink_table = """CREATE TABLE IF NOT EXISTS reviewlink_Table (SearchtermNumber varchar(30) NOT NULL,
                                                                          ReviewNumber varchar(30) NOT NULL,
                                                                          MainlinkNumber varchar(30) NOT NULL,
                                                                          Search_term varchar(255) NOT NULL,
                                                                          Result_Type varchar(255) NOT NULL,
                                                                          URL VARCHAR(255) NOT NULL,
                                                                          Title text NOT NULL,
                                                                          Links text NOT NULL,
                                                                          Rating varchar(255) NOT NULL,
                                                                          Review_Count varchar(255) NOT NULL,
                                                                          Page_Special_Data varchar(255) NOT NULL,
                                                                          PRIMARY KEY (ReviewNumber),
                                                                          UNIQUE KEY (ReviewNumber));"""

create_peoplealsoask_table = """CREATE TABLE IF NOT EXISTS peoplealsoask_Table (SearchtermNumber varchar(30) NOT NULL,
                                                                                QuestionNumber varchar(30) NOT NULL,
                                                                                Search_term varchar(255) NOT NULL,
                                                                                Result_Type varchar(255) NOT NULL,
                                                                                URL VARCHAR(255) NOT NULL,
                                                                                Title text NOT NULL,
                                                                                Special_Title text default NULL,
                                                                                Links text default NULL,
                                                                                Page_Description text default NULL,
                                                                                Position varchar(255) NOT NULL,
                                                                                Page_Special_Data varchar(255) NOT NULL,
                                                                                PRIMARY KEY (QuestionNumber),
                                                                                UNIQUE KEY (QuestionNumber));"""

create_localpack_table = """CREATE TABLE IF NOT EXISTS localpack_Table (SearchtermNumber varchar(30) NOT NULL,
                                                                        LocalPackNumber varchar(30) NOT NULL,
                                                                        Search_term varchar(255) NOT NULL,
                                                                        Result_Type varchar(255) NOT NULL,
                                                                        URL VARCHAR(255) NOT NULL,
                                                                        Images text NOT NULL,
                                                                        Name varchar(255) NOT NULL,
                                                                        Website varchar(255) default NULL,
                                                                        Category varchar(255) NOT NULL,
                                                                        Rating varchar(255) NOT NULL,
                                                                        Review_Count varchar(255) NOT NULL,
                                                                        Address varchar(255) NOT NULL,
                                                                        Phone_Number varchar(255) NOT NULL,
                                                                        Position varchar(255) NOT NULL,
                                                                        Page_Special_Data varchar(255) NOT NULL,
                                                                        PRIMARY KEY (LocalPackNumber),
                                                                        UNIQUE KEY (LocalPackNumber));"""

create_topstory_table = """CREATE TABLE IF NOT EXISTS topstory_Table (SearchtermNumber varchar(30) NOT NULL,
                                                                      StoryNumber varchar(30) NOT NULL,
                                                                      Search_term varchar(255) NOT NULL,
                                                                      Result_Type varchar(255) NOT NULL,
                                                                      URL VARCHAR(255) NOT NULL,
                                                                      Images text NOT NULL,
                                                                      Title text NOT NULL,
                                                                      Links text default NULL,
                                                                      Category varchar(255) NOT NULL,
                                                                      Posted_Time varchar(255) NOT NULL,
                                                                      Position varchar(255) NOT NULL,
                                                                      Page_Special_Data varchar(255) NOT NULL,
                                                                      PRIMARY KEY (StoryNumber),
                                                                      UNIQUE KEY (StoryNumber));"""

create_knowledgecard_table = """CREATE TABLE IF NOT EXISTS knowledgecard_Table (SearchtermNumber varchar(30) NOT NULL,
                                                                                knowledgecard_number varchar(30) NOT NULL,
                                                                                Search_term varchar(255) NOT NULL,
                                                                                Result_Type varchar(255) NOT NULL,
                                                                                URL VARCHAR(255) NOT NULL,
                                                                                Title text NOT NULL,
                                                                                Links text default NULL,
                                                                                Description text NOT NULL,
                                                                                Images text NOT NULL,
                                                                                CardTitle text NOT NULL,
                                                                                Position varchar(255) NOT NULL,
                                                                                Page_Special_Data varchar(255) NOT NULL,
                                                                                PRIMARY KEY (knowledgecard_number),
                                                                                UNIQUE KEY (knowledgecard_number));"""

create_featuresnippet_table = """CREATE TABLE IF NOT EXISTS featuresnippet_Table (SearchtermNumber varchar(30) NOT NULL,
                                                                                  featuredsnippet_Number varchar(30) NOT NULL,
                                                                                  Search_term varchar(255) NOT NULL,
                                                                                  Result_Type varchar(255) NOT NULL,
                                                                                  URL VARCHAR(255) NOT NULL,
                                                                                  Title text NOT NULL,
                                                                                  Links text default NULL,
                                                                                  Description text NOT NULL,
                                                                                  Images text NOT NULL,
                                                                                  CardTitle text NOT NULL,
                                                                                  Position varchar(255) NOT NULL,
                                                                                  Page_Special_Data varchar(255) NOT NULL,
                                                                                  PRIMARY KEY (featuredsnippet_Number),
                                                                                  UNIQUE KEY (featuredsnippet_Number));"""

create_twitterResult_table = """CREATE TABLE IF NOT EXISTS twitterresult_Table (SearchtermNumber varchar(30) NOT NULL,
                                                                                TwitNumber varchar(30) NOT NULL,
                                                                                Search_term varchar(255) NOT NULL,
                                                                                Result_Type varchar(255) NOT NULL,
                                                                                URL VARCHAR(255) NOT NULL,
                                                                                Title text NOT NULL,
                                                                                Links text default NULL,
                                                                                Twits text default NULL,
                                                                                Posted_Time varchar(255) NOT NULL,
                                                                                Position varchar(255) NOT NULL,
                                                                                Page_Special_Data varchar(255) NOT NULL,
                                                                                PRIMARY KEY (TwitNumber),
                                                                                UNIQUE KEY (TwitNumber));"""

create_imagepack_table = """CREATE TABLE IF NOT EXISTS imagepack_Table (SearchtermNumber varchar(30) NOT NULL,
                                                                        Search_term varchar(255) NOT NULL,
                                                                        Result_Type varchar(255) NOT NULL,
                                                                        URL VARCHAR(255) NOT NULL,
                                                                        Images text NOT NULL,
                                                                        Position varchar(255) NOT NULL,
                                                                        Page_Special_Data varchar(255) NOT NULL);"""

create_videopack_table = """CREATE TABLE IF NOT EXISTS videopack_Table (SearchtermNumber varchar(30) NOT NULL,
                                                                        VideoNumber varchar(30) NOT NULL,
                                                                        Search_term varchar(255) NOT NULL,
                                                                        Result_Type varchar(255) NOT NULL,
                                                                        URL VARCHAR(255) NOT NULL,
                                                                        Title text NOT NULL,
                                                                        Links text default NULL,
                                                                        WebsiteName varchar(255) default NULL,
                                                                        CompnayName varchar(255) default NULL,
                                                                        Posted_Time varchar(255) NOT NULL,
                                                                        Position varchar(255) NOT NULL,
                                                                        Page_Special_Data varchar(255) NOT NULL,
                                                                        PRIMARY KEY (VideoNumber),
                                                                        UNIQUE KEY (VideoNumber));"""

alt_table = """ALTER TABLE Mainlinks_Table ADD CONSTRAINT Mainlinks_Table_fk0 FOREIGN KEY (SearchtermNumber) REFERENCES Master_Table(SearchtermNumber);"""
alt_table2 = """ALTER TABLE reviewlink_Table ADD CONSTRAINT reviewlink_Table_fk0 FOREIGN KEY (MainlinkNumber) REFERENCES Mainlinks_Table(MainlinkNumber);"""
alt_table3 = """ALTER TABLE peoplealsoask_Table ADD CONSTRAINT peoplealsoask_Table_fk0 FOREIGN KEY (SearchtermNumber) REFERENCES Master_Table(SearchtermNumber);"""
alt_table4 = """ALTER TABLE localpack_Table ADD CONSTRAINT localpack_Table_fk0 FOREIGN KEY (SearchtermNumber) REFERENCES Master_Table(SearchtermNumber);"""
alt_table5 = """ALTER TABLE topstory_Table ADD CONSTRAINT topstory_Table_fk0 FOREIGN KEY (SearchtermNumber) REFERENCES Master_Table(SearchtermNumber);"""
alt_table6 = """ALTER TABLE knowledgecard_Table ADD CONSTRAINT knowledgecard_Table_fk0 FOREIGN KEY (SearchtermNumber) REFERENCES Master_Table(SearchtermNumber);"""
alt_table7 = """ALTER TABLE featuresnippet_Table ADD CONSTRAINT featuresnippet_Table_fk0 FOREIGN KEY (SearchtermNumber) REFERENCES Master_Table(SearchtermNumber);"""
alt_table8 = """ALTER TABLE twitterresult_Table ADD CONSTRAINT twitterresult_Table_fk0 FOREIGN KEY (SearchtermNumber) REFERENCES Master_Table(SearchtermNumber);"""
alt_table9 = """ALTER TABLE imagepack_Table ADD CONSTRAINT imagepack_Table_fk0 FOREIGN KEY (SearchtermNumber) REFERENCES Master_Table(SearchtermNumber);"""
alt_table10 = """ALTER TABLE videopack_Table ADD CONSTRAINT videopack_Table_fk0 FOREIGN KEY (SearchtermNumber) REFERENCES Master_Table(SearchtermNumber);"""