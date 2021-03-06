import CEvent

typealias EventBase = OpaquePointer

public class Runloop {
    public static let shared = Runloop()

	internal let eventBase:   EventBase
	private var events: [Event]

	public init() {
		eventBase = event_base_new()
		events    = [Event]()
	}

	deinit {
		event_free(eventBase)
	}

	public func register(event: Event) {
		event.add()
		events.append(event)
	}

	public func remove(event: Event) {
		// The event instance takes care of removing and Freeing
		// the libevent event from the eventBase
		events = events.filter { !($0 === event) }

		// In case the event wasn't found we remove it from the libevent queue
		// anyway to prevent any other possible glitches from happening.
		event.remove()
	}

	public func run() {
		guard event_base_dispatch(eventBase) == 1 else {
			fatalError("Runloop failed")
		}
		run()
	}
}
