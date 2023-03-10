package fr.hd3d.html5.video.client.handlers;

import com.google.gwt.event.shared.EventHandler;

import fr.hd3d.html5.video.client.events.VideoCanPlayThroughEvent;


public interface VideoCanPlayThroughHandler extends EventHandler
{
    void onCanPlayThrough(VideoCanPlayThroughEvent event);
}
