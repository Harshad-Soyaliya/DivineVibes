package models;

public class Activity {
    private int id;
    private int roadmapId;
    private String title;
    private String description;
    private int sequenceNo;

    public Activity(int id, int roadmapId, String title, String description, int sequenceNo) {
        this.id = id;
        this.roadmapId = roadmapId;
        this.title = title;
        this.description = description;
        this.sequenceNo = sequenceNo;
    }

    public Activity() {}

    // Getters and Setters
    public int getId() { return id; }
    public int getRoadmapId() { return roadmapId; }
    public String getTitle() { return title; }
    public String getDescription() { return description; }
    public int getSequenceNo() { return sequenceNo; }

    public void setId(int id) { this.id = id; }
    public void setRoadmapId(int roadmapId) { this.roadmapId = roadmapId; }
    public void setTitle(String title) { this.title = title; }
    public void setDescription(String description) { this.description = description; }
    public void setSequenceNo(int sequenceNo) { this.sequenceNo = sequenceNo; }
}
