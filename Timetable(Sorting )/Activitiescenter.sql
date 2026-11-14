CREATE TABLE  IF NOT EXISTS timetable (
   activity_id INTEGER PRIMARY KEY,
   activity_name TEXT NOT NULL,
   activity_type TEXT NOT NULL,
    activity_duration INTEGER NOT NULL,
    Participant_count INTEGER NOT NULL,
    activity_location TEXT NOT NULL,
    activity_day TEXT NOT NULL
);

INSERT INTO timetable VALUES
(1, 'Football Class', 'Fitness', 60, 20, 'Studio A', 'Monday'),
(2, 'Cooking Workshop', 'Culinary', 90, 15, 'Kitchen B', 'Tuesday'),
(3, 'Painting Class', 'Art', 120, 10, 'Art Room C', 'Wednesday'),
(4, 'Robotics Class', 'Technology', 75, 25, 'Studio D', 'Thursday'),
(5, 'Photography Workshop', 'Art', 90, 12, 'Studio E', 'Friday'),
(6, 'Chess Club', 'Wellness', 45, 8, 'Room F', 'Saturday'),
(7, 'Coding Class', 'Technology', 60, 20, 'Computer Lab G', 'Sunday');

SELECT * FROM timetable;

SELECT activity_name, Participant_count FROM timetable
ORDER BY Participant_count DESC;

SELECT activity_name, activity_duration FROM timetable
ORDER BY activity_duration ASC;


SELECT activity_name, activity_type FROM timetable
WHERE activity_type = 'Art';

Select activity_name, activity_location, activity_day FROM timetable
WHERE activity_day = 'Monday';

SELECT activity_name, activity_type FROM timetable
ORDER BY activity_type DESC;

SELECT activity_name, activity_duration FROM timetable
ORDER BY activity_duration ASC LIMIT 4;


SELECT activity_type, COUNT(*) AS Participant_count
FROM timetable
GROUP BY activity_type;

SELECT activity_type, COUNT(*) AS Participant_count
FROM timetable
GROUP BY activity_type
HAVING COUNT(*) > 2;




